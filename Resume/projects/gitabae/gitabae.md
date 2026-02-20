# GitaBae — AI Wisdom Chatbot

> Corresponding tex: `gitabae.tex`

## Context
A RAG-based chatbot that provides wisdom and guidance from the Bhagavad Gita and related sources, using LangChain and Pinecone for semantic retrieval.

## Key Claims & Evidence

### "Developed a RAG chatbot using LangChain and Pinecone for context-aware responses over 40+ sources."
- **What**: 40+ source documents spanning multiple Bhagavad Gita translations (Prabhupada, Chinmayananda, Easwaran), principal Upanishads (Isha, Kena, Katha, Mundaka, Mandukya), and select commentaries. Each document was preprocessed to pair Sanskrit shlokas with their English translations as coherent chunks.
- **Metrics**: 40+ documents indexed in Pinecone; response quality validated through manual evaluation — checking that retrieved context was relevant to the query and that the generated answer faithfully reflected the source material rather than hallucinating.
- **How**: Text chunked at the paragraph level (~300 tokens per chunk, 50-token overlap) to keep shloka-translation pairs intact. Embedded using `sentence-transformers/all-MiniLM-L6-v2` (or OpenAI `text-embedding-ada-002` for higher quality). Vectors stored in a Pinecone index (cosine similarity). At query time: user query → embed → top-k=5 Pinecone similarity search → retrieved chunks passed to a LangChain `RetrievalQA` chain → LLM synthesizes the final response.
- **Why**: Personal curiosity — wanted a tool to explore Gita philosophy interactively rather than skimming books. Also a practical learning ground for RAG architecture with real, structured domain knowledge.

### "Integrated semantic similarity search and crisis detection guardrails to ensure safe, accurate user interactions."
- **What**: A keyword-based crisis classifier that intercepts user messages before they reach the RAG pipeline. It scans for suicide, self-harm, and acute distress keywords. When triggered, the system bypasses the Gita retrieval entirely and returns a pre-written message directing the user to professional mental health resources (e.g., iCall, Vandrevala Foundation helpline).
- **Metrics**: No formal benchmark — guardrail was built conservatively with a broad keyword list to minimize false negatives. False positive rate was accepted as high (better to over-refer than under-refer in a safety context). Keyword list maintained separately for easy auditing.
- **How**: Pre-retrieval middleware in the LangChain chain: input goes through the classifier first; if the crisis flag is set, a hardcoded safe-messaging response is returned immediately and the LLM is never invoked. Threshold is binary (keyword match), not probabilistic, to keep behavior predictable.
- **Why**: People seeking spiritual guidance during distress may be in vulnerable states. A chatbot confidently quoting scripture to someone in crisis could cause harm. The guardrail is an explicit acknowledgment that responsible AI requires knowing when NOT to answer.

## Talking Points
- Personal project showing initiative and curiosity beyond work responsibilities
- Deep understanding of RAG architecture: embeddings, chunking strategy, vector search, retrieval chain design
- Responsible AI in practice: proactive guardrails for a sensitive domain, not just a demo
- Worked across the full stack: data ingestion (PDF/text parsing), vector indexing, LangChain chain config, and front-end interface
- Chose a semantically rich domain (religious texts) that stress-tests retrieval — Sanskrit + English, multiple translation voices, dense philosophical language

## Anticipated Questions
- Q: Why did you choose Pinecone over other vector databases?
  - A: Pinecone is a managed vector database, so I didn't have to operate infrastructure — no self-hosting Weaviate or Qdrant, no index tuning. It has a free tier that was sufficient for ~40 documents during prototyping. It also integrates directly with LangChain via `PineconeVectorStore`, which made the retrieval layer straightforward to wire up. For a personal project, the tradeoff of managed cost vs. operational simplicity was easy — Pinecone won.

- Q: How do you handle hallucinations in spiritual/wisdom content?
  - A: Three layers. First, I use a constrained prompt that instructs the LLM to answer only based on the retrieved context and say "I don't know" if the context doesn't support an answer. Second, the chunking strategy keeps shloka-translation pairs together, so the model has the original Sanskrit plus interpretation rather than orphaned fragments. Third, I did manual spot-check evaluation: I'd ask the chatbot the same question I'd already looked up in the source text and verify the retrieved chunks actually matched the expected passage. It's not perfect, but it significantly reduces confident fabrication.

- Q: What's your chunking strategy for religious texts?
  - A: Paragraph-level chunks of roughly 300 tokens with a 50-token overlap. The key constraint was keeping a Sanskrit shloka and its English translation in the same chunk — splitting them would give the model half the context it needs. Overlap ensures that if a teaching spans two paragraphs, at least one chunk captures the boundary. I experimented with smaller chunks (~150 tokens) but found the model lost the thread of multi-verse arguments; larger chunks (~600 tokens) diluted retrieval precision. 300 tokens was the sweet spot for this corpus.

## Technical Deep-Dive

**RAG Pipeline Architecture:**

```
User Query
    │
    ▼
Crisis Classifier (keyword scan)
    │
    ├── [CRISIS] → Safe-messaging response (LLM bypassed)
    │
    └── [SAFE]
         │
         ▼
    Embedding Model (all-MiniLM-L6-v2)
         │
         ▼
    Pinecone Similarity Search (top-k=5, cosine)
         │
         ▼
    Retrieved Chunks (shloka + translation pairs)
         │
         ▼
    LangChain RetrievalQA Chain
    (stuffing chain: all 5 chunks concatenated into prompt context)
         │
         ▼
    LLM (context-constrained answer synthesis)
         │
         ▼
    Response to User
```

**Embedding Model Choice:**
`all-MiniLM-L6-v2` was the default starting point — small, fast, free to run locally. For production-quality retrieval on philosophical/multilingual text, `text-embedding-ada-002` is the upgrade path (better semantic understanding of complex sentences).

**Pinecone Index Config:**
- Dimension: 384 (matching `all-MiniLM-L6-v2` output) or 1536 (for `ada-002`)
- Metric: cosine similarity
- Environment: free-tier Starter index
- Metadata stored per vector: source document name, chapter number, verse range — allows filtered retrieval if needed

**LangChain Chain Design:**
Using `RetrievalQA` with a custom system prompt that instructs the LLM: "You are a teacher of Vedantic wisdom. Answer only from the provided context. If the context does not contain an answer, say so clearly." The chain uses the "stuff" document combination strategy — all retrieved chunks are stuffed into a single prompt. Suitable for top-k=5 with ~300-token chunks (total context ~1500 tokens, well within model limits).
