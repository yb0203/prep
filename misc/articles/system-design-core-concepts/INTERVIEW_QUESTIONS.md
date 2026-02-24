# System Design Interview Questions & Answers

This file contains real interview questions mapped to concepts in the learning guide.

## Question-Concept Mapping

### Easy Level Questions

#### Q1: "Explain horizontal vs vertical scaling"
**Concept:** Scalability
**Time to answer:** 2-3 minutes

**Good Answer Structure:**
1. Define both
2. Give 2 pros/2 cons of each
3. Give one real-world example
4. Explain when to use which

**Model Answer:**
"Horizontal scaling adds more machines, vertical adds more power to one machine. Horizontal is unlimited but complex (distributed systems), vertical is simple but limited. Netflix uses horizontal because they need to handle millions of users - can't buy a computer that big. Early startups use vertical scaling because simplicity matters more than scale."

**Follow-up:** "What happens to your database when you scale horizontally?"
- "Database becomes bottleneck - still single machine. Need replication for reads, sharding for writes."

---

#### Q2: "What's the difference between caching and a database?"
**Concept:** Caching
**Time to answer:** 2 minutes

**Model Answer:**
"Database is source of truth, stores all data persistently. Cache is fast temporary storage. Database is slower but persistent, cache is faster but ephemeral. Use cache to reduce database load for frequently accessed data."

**Why asked:** Tests if you understand layering

---

#### Q3: "Why would you use a message queue?"
**Concept:** Message Queues
**Time to answer:** 2 minutes

**Model Answer:**
"Message queues decouple services - producer doesn't wait for consumer. Enables handling traffic spikes (queue stores messages), services can process at own pace. If consumer down, messages wait in queue, no data loss."

**Common mistake:** Saying "it's faster" - it's not always faster, it's about decoupling

---

### Medium Level Questions

#### Q4: "Design a system for 1 million concurrent users"
**Concepts:** Scalability, Load Balancing, Caching, Databases
**Time to answer:** 15-20 minutes

**Structure:**
1. Clarify requirements (read-heavy? write-heavy? transactions?)
2. Single server → multiple servers (load balancing)
3. Database bottleneck (replication + sharding)
4. Caching layer (Redis)
5. CDN for static content
6. Monitoring

**Model Answer:**
```
Requirements: 1M concurrent, mostly reads (social media feed)

Architecture:
- Load balancer in front
- 100+ stateless API servers (horizontal scaling)
- Session store in Redis
- Master-slave database replication (500K reads/sec per slave)
- Database sharding by user_id (handle writes)
- Redis cache for hot posts (80/20 principle)
- CDN for images/videos
- Monitoring: latency p99, error rate, database query time

Scaling:
If one component saturates:
- API servers: add more, load balancer distributes
- Database reads: add read replicas
- Database writes: add shards
- Cache: add Redis instances, use consistent hashing
```

**Follow-up:** "What if database master fails?"
- "Use automatic failover: slave elected as new master, writes redirect, data might be lost (replication lag)"

---

#### Q5: "How would you cache user profiles?"
**Concept:** Caching (strategies, invalidation)
**Time to answer:** 10 minutes

**Model Answer:**
"Use cache-aside pattern: app checks cache for profile, if miss fetches from database, stores in cache. TTL of 1 hour. When profile changes, invalidate cache (delete key). If user rarely updated, could use higher TTL."

**Trade-off question:** "Why not write-through?"
- "Write-through is slower, every write hits database. For profiles that rarely change, cache-aside is better."

**Scaling question:** "What if thousands of users access same profile?"
- "Single cache key bottleneck, but handled by Redis anyway. Might use read replicas if database still bottleneck. Cache hits in Redis are sub-millisecond."

---

#### Q6: "Explain the CAP theorem"
**Concept:** Distributed Systems
**Time to answer:** 5 minutes

**Model Answer:**
"CAP says: Consistency, Availability, Partition tolerance - pick 2. Partition tolerance is non-negotiable (partitions happen), so choose C or A. SQL databases choose CP (consistent, goes offline during partition). NoSQL like DynamoDB choose AP (stays online, eventual consistency). During normal operation, you get all 3, but partition forces choice."

**Follow-up:** "Your system chooses Availability. When is eventual consistency unacceptable?"
- "Financial systems (lost money), medical records (wrong data dangerous), inventory (oversell). Choose consistency there instead."

---

### Hard Level Questions

#### Q7: "Design YouTube"
**Concepts:** All 8 concepts
**Time to answer:** 45+ minutes

**Structure:**
1. Requirements: video upload, streaming, search, recommendations
2. API design (endpoints)
3. Data model (videos, users, views)
4. Scaling video storage (S3-like)
5. Streaming: CDN with regional caches
6. Recommendations: ML model, cached results
7. Search: Elasticsearch
8. Monitoring: QPS, buffering ratio, upload success rate

**Key Design Decisions:**
- Videos stored in S3, metadata in database
- Streaming from CDN closest to user
- Recommendation results cached (complex computation)
- Search with Elasticsearch for full-text
- Upload process asynchronous (write-behind queue)

---

#### Q8: "Design a payment system"
**Concepts:** Databases (ACID, transactions), Distributed Systems (consistency), Message Queues, Monitoring
**Time to answer:** 45 minutes

**Critical Decisions:**
- **Database:** SQL (PostgreSQL) for ACID transactions
- **Consistency:** CP on CAP (consistency over availability)
- **Message Queue:** After payment confirmed, send events (async)
- **Idempotency:** Payment must be idempotent (prevent double-charge)
- **Monitoring:** Error rate critical, audit logs for compliance

**Model Answer Structure:**
```
1. Accept payment request
2. Acquire write lock on user account (prevent double-spending)
3. Validate payment (sufficient funds, valid card)
4. Charge payment (atomic transaction)
5. Release lock
6. Send async message: "payment_complete"
7. Consumers: update inventory, send confirmation email
8. If step 4 fails: refund and retry

Idempotency:
- Include payment ID in request
- Check if payment ID already processed
- If yes, return cached result (not process twice)
- Store in database or cache
```

---

#### Q9: "Design a real-time collaboration tool (Google Docs-like)"
**Concepts:** Distributed Systems, Message Queues, Monitoring, CAP
**Time to answer:** 45 minutes

**Challenges:**
- Multiple users editing simultaneously
- Conflicts: User A deletes paragraph, User B edits paragraph
- Operational Transformation (OT) or CRDT (conflict resolution)
- Consistency: all users see same document

**Model Answer:**
```
Architecture:
- WebSocket connections (persistent) to each user
- Document stored in database (PostgreSQL)
- Each edit creates event, stored in event log (immutable)
- OT engine: transforms conflicting edits
- Replication: broadcast edits to all clients
- Eventual consistency: all users converge to same document

Scalability:
- Multiple WebSocket servers (load balanced)
- Document sharding by doc_id
- Message queue: broadcast edits to all servers serving that doc
- Event log: append-only, rebuild document state from events

Monitoring:
- Latency: time from user edit to other users see it
- Consistency: detect if users see different document
- Conflict rate: how many edits conflict
```

---

### Behavioral (Why?) Questions

#### Q10: "Why would you NOT use a database?"
**Testing:** Understanding when to use alternatives

**Model Answer:**
"For session data, use Redis (faster). For search, Elasticsearch (optimized). For analytics, data warehouse. For configuration, consider just code constants. Not every data storage needs a database."

**Real scenario:** "Caching user sessions in database is silly - use Redis."

---

#### Q11: "How do you choose between technologies?"
**Testing:** Decision-making framework

**Model Answer:**
"Look at tradeoffs:
1. What are my requirements? (scale, consistency, latency)
2. What technology fits? (constraints)
3. What's the cost? (operational, infrastructure)
4. Is team experienced? (unknown tech = risk)
5. Can we migrate later? (is decision reversible?)
"

**Example:** "Use PostgreSQL as default. Switch to NoSQL if specific reason (horizontal write scaling, flexible schema). Don't use newest tech just because it's cool."

---

## Question by Difficulty Level

### Easy (5-10 minutes)
- Q1: Horizontal vs vertical scaling
- Q2: Caching vs database
- Q3: Why message queues
- Explain CAP theorem

### Medium (15-20 minutes)
- Q4: Design for 1M users
- Q5: Cache user profiles
- Design a rate limiter
- Design leaderboard

### Hard (45+ minutes)
- Q7: Design YouTube
- Q8: Design payment system
- Q9: Design real-time collab
- Design Twitter feed

## Quick Answers for Common Follow-Ups

**"How many servers/databases do you need?"**
- Do math: 1M users ÷ 10K per server = 100 servers minimum
- Add 2-3x for redundancy and peaks

**"What happens if [component] fails?"**
- Single server: use load balancer to route around
- Database: use replicas, failover
- Load balancer: use multiple, HA setup
- Cache: fallback to database (slower but works)

**"How do you prevent data loss?"**
- Replication (copies on multiple machines)
- Backup (periodic snapshot)
- Write-through (sync writes to disk)

**"How do you handle rapid growth?"**
- Monitor metrics: when 80% capacity, add more
- Caching: 80/20 rule, cache hot data
- Horizontal scaling: add more servers
- Database sharding: split data

---

## Practice Strategy

### Week 1: Foundations
- [ ] Practice easy questions until natural
- [ ] Study CAP theorem deeply
- [ ] Design simple system (leaderboard, rate limiter)

### Week 2: Medium Complexity
- [ ] Design with 1M users
- [ ] Add caching, monitoring
- [ ] Practice explaining clearly

### Week 3: Complex Systems
- [ ] Design YouTube/Twitter
- [ ] Include all 8 concepts
- [ ] Practice time management (answer in 45 min)

### Week 4: Refinement
- [ ] Mock interviews with timer
- [ ] Record yourself, watch back
- [ ] Address weak areas

---

## Common Mistakes to Avoid

1. **Starting with single solution:** Ask requirements first
2. **Ignoring monitoring:** "How will you know it works?" is always asked
3. **Forgetting about failures:** Every component can fail
4. **Over-engineering:** Use simple solutions first
5. **Not explaining tradeoffs:** "Why this and not that?" is key question
6. **Running out of time:** Practice with timer
7. **Talking too fast:** Interviewer needs to follow
8. **Dismissing follow-ups:** These test depth of thinking

---

## Success Criteria

**Good System Design Answer Includes:**
- [ ] Clear requirements first (clarify with interviewer)
- [ ] API/data model design
- [ ] High-level architecture (components and flow)
- [ ] Scalability strategy (handles 10x growth)
- [ ] Failure handling (each component can fail)
- [ ] Database strategy (choice and scaling)
- [ ] Monitoring/metrics (how to know it works)
- [ ] Tradeoffs explained (why these choices)
- [ ] Time management (covered depth in time limit)
- [ ] Clear communication (interviewer can follow)

---

## Additional Practice Resources

**Questions to practice:**
- Design a URL shortener
- Design a rate limiter
- Design a leaderboard
- Design a news feed
- Design a ride-sharing system
- Design a parking lot system
- Design a library management system
- Design a ticketing system

**Each teaches different concepts:**
- URL shortener: caching, hashing, database design
- Rate limiter: distributed algorithms, edge cases
- Leaderboard: database, caching, sorting
- News feed: caching, graph databases, ranking
- Ride-sharing: geospatial, real-time, matching
- Parking lot: OOP, parking algorithm
- Library management: relational database design
- Ticketing: transactions, inventory, concurrency

---

**Start with easy questions, time yourself, record answers. Review what you said - is it clear? Confident? Ask: "Did I explain this clearly enough that someone unfamiliar with systems could understand?"**
