# System Design Core Concepts - Learning Guide

## Table of Contents
1. [Scalability](#scalability)
2. [Load Balancing](#load-balancing)
3. [Caching](#caching)
4. [Databases](#databases)
5. [Distributed Systems](#distributed-systems)
6. [Message Queues](#message-queues)
7. [CDNs and Geographic Distribution](#cdns-and-geographic-distribution)
8. [Monitoring and Logging](#monitoring-and-logging)

---

## Scalability

### Definition and Why It Matters

**Scalability** is the ability of a system to handle increased load by adding resources. It's about designing systems that can grow with user demand without degrading performance. In interviews, this is fundamental because every service needs to handle growth.

**Why it matters:**
- Real-world services grow from thousands to millions of users
- Poor scalability planning leads to system crashes during peak load
- It's often the difference between a successful and failed product launch
- Demonstrates architectural thinking

### Horizontal vs Vertical Scaling

#### Vertical Scaling (Scale Up)
- **Definition:** Adding more power to existing machines (more CPU, RAM, disk)
- **Pros:**
  - Simpler to implement - no distributed system complexity
  - No code changes needed
  - Lower latency within single machine
- **Cons:**
  - Limited by physical hardware limits
  - Single point of failure - one machine goes down, everything fails
  - Expensive - powerful machines cost exponentially more
  - Database bottleneck - eventually you hit ceiling

#### Horizontal Scaling (Scale Out)
- **Definition:** Adding more machines to the system
- **Pros:**
  - Unlimited scalability - add machines as needed
  - No single point of failure - distribute across multiple machines
  - Cost-effective - use commodity hardware
  - Better resource utilization
- **Cons:**
  - More complex - distributed system challenges (consistency, coordination)
  - Code must be stateless or handle distributed state
  - Network latency between machines
  - Operational overhead - managing multiple machines

### Key Principles

1. **Stateless Design:** Servers should not store user state locally. This allows any request to go to any server.
2. **Database Scaling:** Even with many servers, the database becomes the bottleneck. Must address separately through replication, sharding.
3. **Measurement:** Define what "scaling" means - QPS (queries per second), response time, throughput?
4. **Cost vs Performance:** Horizontal scaling trades simplicity for cost. Choose based on requirements.

### Real-World Example

**Netflix Scaling Journey:**
- Started with monolith (vertical scaling)
- As users grew to millions, switched to microservices (horizontal)
- Each service independently scales based on demand
- Can handle millions of concurrent streams by spreading load

**Interview Scenario:**
> "Design a system for a social media app that needs to handle 10 million users"
>
> **Good Answer:** "I'd use horizontal scaling with stateless servers behind a load balancer. Each service (auth, posts, feeds) scales independently. Database becomes the bottleneck, so I'd use replication for reads and consider sharding for writes."

### Common Follow-Up Questions

1. **"When would you use vertical scaling instead?"**
   - Early stages when complexity isn't justified
   - When latency is critical (financial transactions)
   - When coordination overhead is too high

2. **"How do you scale a database?"**
   - Read replicas for read-heavy workloads
   - Sharding for write-heavy workloads
   - Caching layer to reduce database hits

3. **"What's the difference between scaling and performance optimization?"**
   - Scaling: handling more load by adding resources
   - Performance: making system faster for same load (code optimization, indexing)

4. **"How many servers do you need to handle 1 million concurrent users?"**
   - Depends on: requests per user, CPU per server, processing time
   - Example: 100K QPS ÷ 1K QPS per server = 100 servers minimum
   - Add 2-3x for redundancy and peak load variations

---

## Load Balancing

### Definition and Why It Matters

**Load Balancing** is the process of distributing incoming requests across multiple servers to ensure no single server becomes a bottleneck. It's essential for:
- Maximizing resource utilization
- Preventing any single server from being overloaded
- Ensuring high availability
- Providing transparent scaling

### Types of Load Balancers

#### 1. Hardware Load Balancers
- Physical appliances (expensive, not cloud-friendly)
- Example: F5 Networks
- Used by large enterprises

#### 2. Software Load Balancers
- Run on machines or containers
- Example: Nginx, HAProxy, Apache
- Most common in cloud environments

#### 3. Cloud Load Balancers
- Managed service from cloud provider
- Examples: AWS ELB/ALB, Google Cloud Load Balancer
- Automatically scale with demand

### Load Balancing Algorithms

#### 1. Round Robin
```
Request 1 → Server A
Request 2 → Server B
Request 3 → Server C
Request 4 → Server A (cycle repeats)
```
- **Pros:** Simple, fair distribution
- **Cons:** Doesn't account for server capacity or current load
- **Use Case:** When all servers have similar capacity

#### 2. Least Connections
```
Routes new request to server with fewest active connections
```
- **Pros:** Better load distribution than round robin
- **Cons:** Doesn't account for request complexity
- **Use Case:** Long-lived connections (WebSockets, video streaming)

#### 3. Weighted Round Robin
```
Server A (weight 3) gets 3x more traffic than Server B (weight 1)
```
- **Pros:** Handles servers of different capacities
- **Cons:** Static weights, doesn't adapt to real-time load
- **Use Case:** Heterogeneous server environment

#### 4. IP Hash
```
hash(client_ip) % num_servers = assigned server
```
- **Pros:**
  - Same client always goes to same server
  - No server state needed (sticky sessions)
  - Useful for session affinity
- **Cons:**
  - Uneven distribution if clients have non-uniform IPs
  - Can't rebalance when servers added/removed
- **Use Case:** Stateful services needing session persistence

#### 5. Resource Based (Dynamic)
```
Routes based on: CPU usage, memory, response time of each server
```
- **Pros:** Most optimal distribution
- **Cons:** More complex, requires monitoring
- **Use Case:** Critical systems where optimal load matters

### Layers of Load Balancing

#### Layer 4 (Transport Layer - TCP/UDP)
- Works at connection level
- Very fast - minimal processing
- Good for throughput
- Examples: AWS Network Load Balancer

#### Layer 7 (Application Layer - HTTP)
- Works at request level
- Can inspect request content
- Can route based on URL, hostname, headers
- More flexible but slightly slower
- Examples: AWS Application Load Balancer, Nginx

### Real-World Example

**Google's Load Balancing:**
- Uses global load balancing across data centers
- Directs users to nearest geographic location
- Uses health checks to route around failing servers
- Accounts for real-time server capacity

**Interview Scenario:**
> "Design a system that serves 1 million requests per second"
>
> **Good Answer:** "I'd use Layer 7 (application) load balancing for flexibility. Route based on request type (images vs API calls) to appropriate servers. Use least-connections algorithm for better distribution. Layer 4 load balancing in front for sheer throughput. Multiple load balancers in active-active configuration for redundancy."

### Common Follow-Up Questions

1. **"How does the load balancer know if a server is down?"**
   - Health checks: periodic requests to each server
   - If server doesn't respond, marked as unhealthy
   - Stop sending requests until healthy again
   - Example: POST /health-check expected 200 response

2. **"How do you handle session persistence?"**
   - Option 1: Sticky sessions (IP hash) - same client to same server
   - Option 2: Distributed session store (Redis)
   - Better: Make services stateless

3. **"What happens if load balancer fails?"**
   - Multiple load balancers in high availability setup
   - Use virtual IP (VIP) - if primary fails, VIP moves to backup
   - Health checks between load balancers

4. **"How does load balancing work with database?"**
   - Load balancing is for compute layer only
   - Database has separate replication strategy
   - Read replicas behind read-only load balancer

5. **"Can you load balance at database level?"**
   - Limited options: connection pooling, read replicas
   - True load balancing requires sharding (splits data)
   - Sharding is application-aware, not transparent

---

## Caching

### Definition and Why It Matters

**Caching** is storing frequently accessed data in fast-access storage to reduce latency and database load. It's one of the most impactful optimizations because:
- Reduces database hits (database is slow)
- Dramatically improves response times
- Enables handling more users with same infrastructure
- However, introduces consistency challenges

**Golden Rule:** "There are only two hard things in Computer Science: cache invalidation and naming things." - Phil Karlton

### Caching Layers

```
Request Flow (with caching):
Client Request
    ↓
Browser Cache (client-side)
    ↓
CDN Cache (geographic layer)
    ↓
Application-level Cache (Redis/Memcached)
    ↓
Database
```

### 1. Client-Side Caching

```
Browser stores: HTML, CSS, JS, images
```
- **Duration:** Set via HTTP headers (Cache-Control, Expires)
- **Pros:** Eliminates network request
- **Cons:** User might see stale data
- **Common Duration:**
  - Static assets: 1 year
  - HTML: 1 hour
  - API responses: 5-30 minutes

### 2. Application-Level Caching (Most Important for Interviews)

#### Memory Cache (In-Process)
```
Cache in application memory (Java HashMap, Python dict)
```
- **Pros:** Fastest - memory access
- **Cons:**
  - Lost on process restart
  - No sharing between instances
  - Limited by single machine memory
- **Use Case:** Temporary working data, rarely for production

#### Distributed Cache (Redis, Memcached)
```
Separate service storing key-value pairs
```
- **Pros:**
  - Shared across all servers
  - Persists across restarts (Redis)
  - Atomic operations (Redis)
  - Extremely fast (sub-millisecond)
- **Cons:**
  - Network latency (microseconds, but adds up)
  - Another service to maintain
  - Memory is expensive
- **Use Case:** Primary caching layer for most systems

### Common Caching Strategies

#### 1. Cache-Aside (Lazy Loading)
```
Application logic:
1. Check cache for data
2. If miss, fetch from database
3. Store in cache
4. Return to user

Code example:
value = cache.get(key)
if value is null:
    value = database.get(key)
    cache.set(key, value)
return value
```
- **Pros:** Simple, data is always fresh
- **Cons:** First request is slow, cache misses are expensive
- **Common in:** Web applications, APIs

#### 2. Write-Through
```
Write flow:
1. Write to cache
2. Write to database (synchronously)
3. Return success to user

Delete flow:
1. Delete from cache
2. Delete from database
```
- **Pros:**
  - Cache and database always consistent
  - No stale data
- **Cons:**
  - Slower writes (must write to both)
  - Database outage blocks writes
- **Common in:** Financial systems (need consistency)

#### 3. Write-Behind (Write-Back)
```
Write flow:
1. Write to cache only
2. Return success to user immediately
3. Asynchronously write to database

Example: Social media likes
```
- **Pros:**
  - Fast writes (only cache)
  - Batches writes to database
  - Can handle database failures briefly
- **Cons:**
  - Data loss risk if cache fails before flush
  - Cache and database might be inconsistent
  - Complex to implement
- **Common in:** User analytics, likes/views, non-critical data

#### 4. Refresh-Ahead
```
Before cache expires:
1. Automatically refresh data from database
2. Extend TTL

Code:
if (time_until_expiry < threshold):
    cache.refresh(key)
```
- **Pros:**
  - Avoids cache misses on hot data
  - Users always get fresh data
- **Cons:**
  - Complex, might refresh data that's not accessed
  - Wastes resources on unpopular data
- **Common in:** Real-time leaderboards, trending data

### Cache Invalidation Strategies

#### 1. TTL (Time-To-Live)
```
Set expiration time when caching
cache.set(key, value, ttl=3600)  # 1 hour
```
- **Pros:** Simple, automatic cleanup
- **Cons:** Stale data until expiry
- **When to use:** When staleness is acceptable

#### 2. Event-Based Invalidation
```
When data changes, explicitly clear cache
function updateUser(id, data):
    database.update(id, data)
    cache.delete("user:" + id)
```
- **Pros:** Data is always fresh
- **Cons:** Need to remember all cache keys related to data
- **Complexity:** High - need to track dependencies

#### 3. Dependency-Based Invalidation
```
Track cache dependencies
userCache depends on userIdCache, settingsCache
When any dependency changes, invalidate all
```
- **Pros:** Cleaner invalidation logic
- **Cons:** Complex to implement, overhead
- **Common in:** Advanced systems like Graph QL

### Real-World Example

**Facebook's Caching:**
- Memcached for object-level cache
- TTL typically 24 hours for most data
- Event-based invalidation for critical updates
- Multiple cache layers: local, regional, global
- Handles 100+ billion cache lookups daily

**Interview Scenario:**
> "Design an Instagram feed system that returns 10 latest posts from followed users"
>
> **Good Answer:** "I'd use cache-aside pattern with Redis. Cache feed by user_id with 5-minute TTL. When user follows/unfollows, invalidate their feed cache. For very active users, I'd prefetch the feed (refresh-ahead) to avoid misses. Store post count with feed key to detect staleness."

### Common Follow-Up Questions

1. **"What's the difference between Redis and Memcached?"**
   - Redis: persists to disk, supports complex data types, atomic operations
   - Memcached: in-memory only, simple key-value, distributed
   - Choose Redis for critical data, Memcached for pure speed

2. **"How do you handle cache misses at scale?"**
   - Thundering herd: when popular item expires, all requests hit database
   - Solution: Probabilistic early expiration or distributed lock
   - Also: Sharding hot keys across multiple cache instances

3. **"Should you cache database queries or computed results?"**
   - Depends: cache query results if expensive
   - Cache computed results to avoid recalculation
   - Example: cache "top 10 trending topics" not raw data

4. **"How much data should you cache?"**
   - Rules of thumb: 1-10% of database size
   - Focus on: 80/20 principle - 20% of data drives 80% of reads
   - Monitor hit rates - goal is 90%+ hit rate

5. **"What happens during cache failure?"**
   - Depends on strategy:
     - Cache-aside: slower performance but no data loss
     - Write-through: operations block until cache recovers
     - Write-behind: potential data loss
   - Have fallback to database

---

## Databases

### Definition and Why It Matters

Databases are the source of truth for persistent data. Choosing the right database type is critical because:
- Wrong choice leads to performance issues at scale
- Different types optimize for different access patterns
- Can't easily switch after billions of records
- Directly impacts system performance and cost

### SQL Databases (Relational)

#### Characteristics
- **Structure:** Rows and columns in predefined schema
- **ACID Properties:**
  - Atomicity: All or nothing
  - Consistency: Data validity rules enforced
  - Isolation: Concurrent transactions don't interfere
  - Durability: Committed data survives failures
- **Relationships:** Foreign keys enforce relationships between tables
- **Query Language:** SQL - expressive, standardized

#### Advantages
- **Strong Consistency:** No chance of inconsistency
- **Complex Queries:** JOIN multiple tables easily
- **ACID Guarantees:** Safe for critical data
- **Transactions:** Multi-statement operations
- **Data Integrity:** Constraints prevent bad data

#### Disadvantages
- **Scaling:** Hard to scale writes horizontally (sharding is complex)
- **Schema Changes:** Require downtime for large tables
- **Performance:** Joins and complex queries get slow at scale
- **Flexibility:** Schema must be defined upfront

#### Examples
- PostgreSQL: Open source, feature-rich
- MySQL: Lightweight, widely used
- Oracle: Enterprise, expensive
- SQL Server: Enterprise Microsoft

#### When to Use
- Financial systems (needs ACID)
- Systems with complex relationships
- When consistency is more important than availability
- Traditional applications

### NoSQL Databases

#### Document Databases (MongoDB, Firebase)

```
Structure:
{
  _id: ObjectId,
  name: "John",
  email: "john@example.com",
  preferences: {
    theme: "dark",
    notifications: true
  }
}
```

**Characteristics:**
- Flexible schema - each document can differ
- Hierarchical data - nested objects
- Query with JavaScript-like syntax

**Advantages:**
- **Flexible:** Schema changes don't require migration
- **Developer-friendly:** Maps to code objects
- **Scalable:** Easier to shard than SQL
- **Nested Data:** Handle complex structures naturally

**Disadvantages:**
- **No Joins:** Relationships require separate queries
- **Duplicated Data:** Same data in multiple documents
- **Weaker Consistency:** No strong transaction support

**Use Cases:**
- User profiles, product catalogs, content management
- Rapid iteration where schema changes often

#### Key-Value Databases (Redis, DynamoDB)

```
Structure:
Key: user:1001
Value: {name: "John", email: "john@example.com"}
```

**Characteristics:**
- Simple structure - key maps to value
- Extremely fast - in-memory or highly optimized
- Limited query capabilities

**Advantages:**
- **Speed:** Fastest database access
- **Simplicity:** No complex queries needed
- **Scaling:** Built-in replication/sharding
- **Flexibility:** Value can be any data type

**Disadvantages:**
- **Limited Queries:** Can't query on values
- **No Relationships:** Must manage manually
- **Memory Intensive:** Stores everything in RAM (Redis)

**Use Cases:**
- Caching, sessions, leaderboards, real-time counters
- Also used as primary database for mobile apps (DynamoDB)

#### Graph Databases (Neo4j)

```
Structure:
Person -[KNOWS]-> Person
       -[WORKS_AT]-> Company
```

**Characteristics:**
- Optimized for relationships
- Fast relationship traversal

**Advantages:**
- **Relationship Queries:** Finding connections is fast
- **Pattern Matching:** Easy to find similar patterns
- **Natural Model:** Relationships are first-class

**Disadvantages:**
- **Limited Ecosystem:** Less common, smaller community
- **Scaling:** Harder to scale horizontally
- **Cost:** Enterprise tools are expensive

**Use Cases:**
- Social networks, recommendation engines, knowledge graphs

#### Search Databases (Elasticsearch, Solr)

```
Full-text search: "Find all posts containing 'system design'"
```

**Characteristics:**
- Optimized for text search and analytics
- Inverted index for fast queries

**Use Cases:**
- Search functionality, logs, analytics

### SQL vs NoSQL Decision Matrix

| Criteria | SQL | NoSQL |
|----------|-----|-------|
| **Consistency** | Strong | Eventual |
| **Scaling** | Vertical | Horizontal |
| **Schema** | Fixed | Flexible |
| **Relationships** | Easy (Joins) | Hard |
| **Transactions** | Multi-statement | Limited |
| **Speed** | Good | Excellent |
| **Setup** | Complex | Simple |

### Database Scaling Techniques

#### 1. Replication (Read Scaling)

```
Master Database (writes)
    ↓
Slave Database 1 (reads)
Slave Database 2 (reads)
Slave Database 3 (reads)
```

**How it works:**
- Master handles writes
- Slaves receive updates asynchronously
- All reads go to slaves

**Advantages:**
- Scales read performance
- Distributes read load
- Provides failover capability

**Disadvantages:**
- Replication lag - slaves might have stale data
- Master becomes write bottleneck
- All writes still go to one place

**Use Cases:**
- Read-heavy workloads (typical web applications)
- Example: 100 reads for every write

#### 2. Sharding (Write Scaling)

```
Write-heavy system:
User data split by ID range:
- Shard 1: user IDs 1-1M
- Shard 2: user IDs 1M-2M
- Shard 3: user IDs 2M-3M
```

**How it works:**
- Split data across multiple databases
- Each shard holds subset of data
- Route queries to correct shard

**Advantages:**
- Scales writes horizontally
- Each shard is smaller, faster
- Distribute load across multiple machines

**Disadvantages:**
- Complex logic - must route correctly
- Uneven distribution possible
- Cross-shard queries are expensive
- Rebalancing is complex

**Sharding Strategies:**

1. **Range-Based:**
   - Split by ID ranges
   - Pros: Simple to implement
   - Cons: Uneven distribution (some ranges more active)

2. **Hash-Based:**
   - hash(user_id) % num_shards = shard_id
   - Pros: Even distribution
   - Cons: Hard to rebalance when shards change

3. **Directory-Based:**
   - Lookup table: key → shard_id
   - Pros: Maximum flexibility
   - Cons: Lookup table becomes bottleneck

**Interview Scenario:**
> "Design a system to store 1 billion user records"
>
> **Good Answer:** "I'd use PostgreSQL as primary database. For reads, set up master-slave replication to 3 read replicas. For writes, implement hash-based sharding across 10 shards. Each shard runs on separate server. Use connection pooling to limit connections. Implement consistent hashing for future shard additions."

### Common Follow-Up Questions

1. **"When would you use NoSQL instead of SQL?"**
   - When schema is flexible/evolving
   - When horizontal scaling is critical
   - When you don't need complex relationships
   - When eventual consistency is acceptable

2. **"How do you handle transactions across shards?"**
   - Two-phase commit (slow, complex)
   - Distributed transactions (difficult)
   - Better: Avoid cross-shard transactions
   - Design data so transactions stay within shard

3. **"How do you handle replication lag?"**
   - Read from master for critical data (after writes)
   - Cache recently written data
   - Accept eventual consistency where acceptable
   - Use quorum reads (wait for majority replicas)

4. **"How many shards should you have?"**
   - Start with 2-4 shards
   - Monitor: if any shard > 80% capacity, add more
   - Aim for even distribution
   - Rule of thumb: 1 shard per 100GB data

5. **"What's the difference between replication and backup?"**
   - Replication: real-time copy for scalability/failover
   - Backup: periodic snapshot for disaster recovery
   - Need both: replication for HA, backup for recovery

---

## Distributed Systems

### Definition and Why It Matters

A **Distributed System** is collection of independent computers communicating through network, appearing as single coherent system. Most modern systems are distributed because:
- Single machines can't handle scale needed
- Provides redundancy and fault tolerance
- Enables geographic distribution
- But introduces fundamental challenges

### CAP Theorem

The fundamental theorem of distributed systems. You can guarantee only 2 of 3:

```
    C (Consistency)
    /            \
   /              \
  A -------- P
(Availability)  (Partition Tolerance)
```

#### 1. Consistency (C)
- **Definition:** All nodes see same data at same time
- **Strong Consistency:** Guaranteed - all replicas identical
- **Eventual Consistency:** Eventually same - replicas sync over time

#### 2. Availability (A)
- **Definition:** System is always available for requests
- **Guarantee:** Every request gets response (success or failure)
- **No Timeouts:** System responds within acceptable time

#### 3. Partition Tolerance (P)
- **Definition:** System works despite network partitions
- **Partition:** Network fails - some nodes can't reach others
- **Practical Reality:** Network partitions happen, can't avoid them

### Why Only 2?

**Scenario: Network Partition Between Nodes**

```
Server A ⟷ [NETWORK PARTITION] ⟷ Server B
```

Three options:

1. **Choose C + P (Consistency + Partition Tolerance)**
   - When network fails, servers go offline
   - They don't accept requests rather than send inconsistent data
   - **Trade-off:** Sacrifice availability
   - **Example:** Traditional SQL databases (CA systems converted to CP during partition)

2. **Choose A + P (Availability + Partition Tolerance)**
   - When network fails, both servers keep accepting requests
   - Clients might see different data (inconsistent)
   - **Trade-off:** Sacrifice consistency
   - **Example:** NoSQL databases like Dynamo, Cassandra

3. **Choose C + A (Consistency + Availability)**
   - Only possible if no partitions occur
   - Impractical - partitions will happen
   - **Not realistic for distributed systems**

### Eventual Consistency

When you choose AP (Availability + Partition Tolerance), you get eventual consistency:

```
Write to Node A:
Time 0: "User age = 30"
Time 1: Node A has age=30, Node B has age=25 (INCONSISTENT)
Time 2: Sync completes, both have age=30 (CONSISTENT)
```

**Challenges:**
- Client might read stale data
- Parent-child relationships might be broken
- Complex application logic needed

**When acceptable:**
- User preferences (can show stale data)
- Analytics (eventual accuracy is fine)
- Social media (eventual is expected)

**When NOT acceptable:**
- Financial transactions (must be consistent)
- Medical records (inconsistency is dangerous)
- Inventory (can't oversell)

### Common Patterns in Distributed Systems

#### 1. Replication
```
Write → Master
       ↓
    Master broadcasts to
       ↓
    Slave 1, Slave 2, Slave 3
```
**Trade-off:** More replicas = more consistency but slower writes

#### 2. Consensus (Agreement)
When multiple nodes need to agree on state:

**Raft Algorithm:**
- Leader elected
- Leader proposes changes
- Followers acknowledge
- Leader commits once majority agrees

**Byzantine Fault Tolerance:**
- Handles malicious nodes
- Used in blockchain
- Very complex

#### 3. Leader Election
When leader fails, elect new one:

```
If leader fails → Followers vote → New leader elected
```

**Challenges:**
- Network partition: multiple leaders possible (split brain)
- Solution: Majority voting - only majority can elect leader

#### 4. Quorum Reads/Writes
```
Write:
1. Write to 3 replicas
2. Return success when 2 acknowledge (majority)
3. Guarantees: if 1 fails, data is safe on other 2

Read:
1. Read from 3 replicas
2. Return value from majority
3. Guarantees: get latest write even if 1 replica behind
```

**Trade-off:** Stronger consistency but slower operations

### Handling Failures in Distributed Systems

#### Fault Types

1. **Fail-Stop:** Process crashes (simplest)
2. **Fail-Recover:** Process crashes then restarts
3. **Byzantine:** Process acts arbitrarily (hardest)

#### Failure Recovery

```
Scenario: Node crashes while writing to database

Option 1: Write before announcement
→ Data saved, client never told success → Lost write

Option 2: Announce before write
→ Client told success, crash before write → Inconsistency

Option 3: Atomic commit
→ Use two-phase commit or write-ahead logging
→ Complex, slow
```

### Distributed Consensus Algorithms

#### Paxos
- Complex to understand and implement
- Guarantees: safe, but might have liveness issues
- Academic importance

#### Raft
- Easier to understand than Paxos
- Designed for practical implementation
- Same safety/liveness guarantees
- Used in etcd, Consul, Kafka

#### Practical Byzantine Fault Tolerance (PBFT)
- Handles byzantine failures
- Very complex
- Only used when byzantine nodes possible
- Used in blockchain

### Real-World Example

**Amazon's Dynamo:**
- Chooses Availability over Consistency (AP)
- Uses Eventual Consistency
- Quorum reads/writes for balance
- Eventual reconciliation via vector clocks
- Handles millions of writes/reads per second

**Interview Scenario:**
> "Design a distributed cache for user sessions that can tolerate failures"
>
> **Good Answer:** "I'd use a key-value store like Redis with replication. Since sessions are critical, I'd choose CP (consistency + partition tolerance) - go offline rather than return stale session. Use quorum writes (W+R > N) to ensure durability. If network partition, use majority quorum to decide which replica is authoritative."

### Common Follow-Up Questions

1. **"Can you avoid CAP theorem tradeoffs?"**
   - No. It's fundamental limitation
   - But: system design can minimize impact
   - Example: Different consistency for different data

2. **"What's the difference between consistency and availability?"**
   - Consistency: correctness of data
   - Availability: responsiveness of system
   - Consistency is about semantics, availability is about response

3. **"How do you detect network partitions?"**
   - Heartbeats: nodes send regular "I'm alive" messages
   - Timeout: if no message after X seconds, node assumed dead
   - Problem: can't distinguish dead node from partition

4. **"Can a system be both consistent and available?"**
   - Within a single data center: maybe (fast network)
   - Across data centers: never (network partitions happen)
   - Trade-off is inevitable at scale

5. **"What are vector clocks?"**
   - Track causal relationships in distributed system
   - Detect whether events happened in order or parallel
   - Used to merge conflicting writes
   - Complex but needed for eventual consistency

---

## Message Queues

### Definition and Why It Matters

**Message Queues** are systems for asynchronous communication between services. Instead of direct requests, services send messages:

```
Synchronous (without queue):
Service A calls Service B → wait for response → continue

Asynchronous (with queue):
Service A sends message to queue → continues immediately
Queue stores message → Service B reads when ready
```

**Why it matters:**
- Decouples services (Service B can be slow/down)
- Load smoothing (handles traffic spikes)
- Enables complex workflows
- Improves resilience

### Key Concepts

#### Message
Single unit of work/information:
```
{
  type: "order_placed",
  order_id: 12345,
  user_id: 67890,
  amount: 99.99,
  timestamp: "2026-01-29T10:00:00Z"
}
```

#### Queue
Storage where messages wait to be processed:
```
Queue: [Message1, Message2, Message3]
Consumer picks up Message1, processes, removes
```

#### Producer
Service that creates/sends messages:
```
Online store → Message: "order_placed" → Queue
```

#### Consumer
Service that reads and processes messages:
```
Queue → Notification service processes Message → sends email
```

#### Topic (in Pub/Sub)
Channel where messages are published:
```
"order_events" topic:
- Order placed subscribers
- Payment processors
- Inventory managers
All receive same message
```

### Message Queue Patterns

#### 1. Point-to-Point (Queue)
```
Producer → Queue → Consumer
         ↓
    Message delivered to exactly ONE consumer
    Even if multiple consumers, each message processed once
```

**Use Case:** Task processing (send email, resize image, process payment)
**Example:** AWS SQS, RabbitMQ

#### 2. Publish-Subscribe (Pub/Sub)
```
Publisher → Topic ← Subscriber 1
          ← Subscriber 2
          ← Subscriber 3

    Message delivered to ALL subscribers
```

**Use Case:** Event notifications (order placed, user signed up)
**Example:** AWS SNS, Apache Kafka, Google Pub/Sub

#### 3. Request-Reply
```
Service A sends message to queue
Includes reply_to field with response queue address
Service B processes, sends response to reply queue
Service A waits on reply queue
```

**Use Case:** Remote procedure calls over async system
**Example:** RabbitMQ with reply_to feature

### Message Queue Systems

#### RabbitMQ
- **Model:** Producer → Exchange → Queue → Consumer
- **Guarantees:**
  - Delivery: at-least-once (might receive twice)
  - Ordering: within single queue
- **Features:** Complex routing, priority queues, dead letter queues
- **Scaling:** Master + replicas
- **Good for:** Complex routing needs, traditional message queue

#### Apache Kafka
- **Model:** Producer → Topic (partitioned) → Consumer Group
- **Guarantees:**
  - Ordering: per partition
  - Durability: persists to disk
- **Features:**
  - Log-based (can replay messages)
  - Consumer groups for parallel processing
  - Horizontal scaling via partitions
- **Scaling:** Built-in sharding
- **Good for:** High-throughput, log processing, streaming

#### AWS SQS
- **Model:** Simple queue
- **Guarantees:**
  - At-least-once delivery
  - No guaranteed ordering (FIFO option available)
- **Features:** Fully managed, auto-scaling, integration with AWS
- **Good for:** Simple use cases, serverless, no ops needed

#### Google Pub/Sub
- **Model:** Pub/Sub
- **Guarantees:** At-least-once delivery
- **Features:** Fully managed, scales automatically, global
- **Good for:** Real-time data, Google Cloud ecosystem

### Message Processing Patterns

#### 1. At-Least-Once Delivery
```
Message sent from queue
Consumer processes
If crash before acknowledgment, message redelivered
Result: might process twice
```

**Requirement:** Processing must be idempotent
```
Example: Adding $10 to account
Good: SET balance = balance + 10 (if idempotent key exists)
Bad: balance += 10 (processes twice: +20 instead of +10)
```

**When acceptable:** Non-critical updates
**Implement idempotency:** Track processed message IDs

#### 2. Exactly-Once Delivery
```
Message guaranteed to be processed exactly once
Requires: distributed transaction (complex)
```

**Very complex, usually not worth it:**
- Use at-least-once + idempotency instead
- Easier to implement, same result

#### 3. Dead Letter Queue
```
Message fails to process after max retries
Moved to dead letter queue (DLQ)
Operator inspects, manually reprocesses or fixes
```

**Use:** Handling poison messages (always fail)
**Example:** Message with invalid format

### Real-World Example

**Uber's Architecture:**
- Uses message queue for ride requests
- Producer: user requests ride
- Queue: stores thousands of pending requests
- Consumers: driver matching services
- Benefits: can handle traffic spikes, drivers can be slow/offline

**Interview Scenario:**
> "Design system where user sends payment that triggers multiple services (charge card, update inventory, send email)"
>
> **Good Answer:** "I'd use message queue with publisher-subscriber pattern. Payment service publishes 'payment_complete' event. Multiple subscribers listen: billing service charges card, inventory service updates stock, notification service sends email. If any service is slow, others aren't blocked. Add retry logic and DLQ for failed messages."

### Common Follow-Up Questions

1. **"How do you handle message ordering?"**
   - Kafka: within same partition, messages ordered
   - RabbitMQ: within same queue, messages ordered
   - Across multiple consumers: no ordering guarantee
   - If ordering needed: route related messages to same partition/queue

2. **"How do you ensure message delivery?"**
   - Persistent storage: messages written to disk before confirmed
   - Replication: copies on multiple machines
   - Acknowledgments: consumer confirms processing
   - Retry logic: redeliver failed messages

3. **"What's the difference between queues and topics?"**
   - Queue: each message to one consumer
   - Topic: each message to all subscribers
   - Use queue for tasks, topics for notifications

4. **"How do you scale message processing?"**
   - Kafka: increase partition count, add consumer instances
   - RabbitMQ: add consumer servers
   - Monitor queue depth: if growing, add more consumers

5. **"What happens if processing is slower than messages arrive?"**
   - Queue grows
   - Eventually runs out of memory/disk
   - Must add more consumers or optimize processing
   - Monitor: if queue depth increasing, scale up

6. **"How do you handle schema evolution?"**
   - Add fields as optional (backward compatible)
   - Consumers ignore unknown fields
   - Use versioning if breaking changes needed
   - Kafka: Schema Registry manages this

---

## CDNs and Geographic Distribution

### Definition and Why It Matters

**Content Delivery Network (CDN)** is geographically distributed network of servers that cache and serve content to users from location closest to them. Critical because:
- Users expect fast loads (milliseconds matter)
- Reduces latency significantly
- Reduces load on origin servers
- Improves reliability (geographic redundancy)

**Key insight:** Physics matters - light travels at ~300,000 km/s. 1000 km away = 3+ milliseconds latency minimum.

### How CDNs Work

```
User in Tokyo requests image

1. Browser checks: is this URL cached locally? No
2. Browser makes request to: "image.example.com"
3. DNS resolves to closest CDN edge server
4. If cached: return immediately from CDN Tokyo server
5. If not cached: CDN server fetches from origin, caches, returns
6. Future requests: hit cache, super fast

Result: Instead of 100ms from origin, 10ms from local CDN
```

### CDN Architecture

```
Internet
    ↓
    ├→ User (USA) → CDN Edge (USA) → Origin
    ├→ User (Europe) → CDN Edge (Europe) → Origin
    └→ User (Asia) → CDN Edge (Asia) → Origin

Users connect to nearest edge
Edges serve cached content
Reduces traffic to origin 100x
```

### What CDNs Cache

#### Static Content (Ideal for CDN)
- Images (JPG, PNG, WebP)
- Videos (streams from closest edge)
- CSS, JavaScript files
- HTML (with careful TTL)
- Downloads (software, PDFs)

**Characteristics:**
- Doesn't change frequently
- Large file sizes
- Cost-effective to cache
- Most bandwidth savings come here

#### Dynamic Content (Tricky for CDN)
- User-specific data (profiles, recommendations)
- Real-time updates (stock prices, scores)
- Personalized HTML

**Challenges:**
- Can't cache: each user sees different data
- Can partially cache: cache API responses
- Advanced techniques: edge computing (run code on edge)

### CDN Services

#### Traditional CDNs
- **Akamai:** Oldest, most expensive, best coverage
- **CloudFlare:** Modern, cheap, good for web apps
- **Fastly:** Developer-friendly, edge computing
- **AWS CloudFront:** Integrates with AWS ecosystem

#### Characteristics
- Global network: hundreds of data centers
- Redundancy: content replicated across edges
- DDoS protection: built-in security
- Cache invalidation: control what to cache

### CDN Decision Matrix

| Aspect | Good for CDN | Bad for CDN |
|--------|-------------|-----------|
| **Content** | Static files | User-specific data |
| **Change Frequency** | Rarely changes | Changes often |
| **Personalization** | Generic | Highly personalized |
| **Size** | Large files | Small requests |
| **Latency Sensitivity** | High (images, videos) | Already low (APIs) |

### Caching Headers (How to Control CDN)

```
HTTP Response Headers:
Cache-Control: public, max-age=3600
    → public: can cache everywhere (CDN, browser)
    → max-age=3600: valid for 1 hour

Cache-Control: private, max-age=300
    → private: only browser cache, not CDN
    → max-age=300: valid for 5 minutes

Cache-Control: no-cache
    → Must validate with server before using
    → Server might say "304 Not Modified" (still use)

Cache-Control: no-store
    → Never cache, fetch every time

Expires: Wed, 29 Jan 2026 12:00:00 GMT
    → Older header, specifies exact expiration time
```

### Geographic Distribution Strategy

#### 1. Single Origin
```
All users → Single Data Center (USA)
Problem: 150ms+ latency for Asia users
```

#### 2. CDN Only
```
User → Nearest CDN → Origin
Good for static content
Problem: Dynamic content still goes to origin (long latency)
```

#### 3. Multi-Region Deployment
```
User (USA) → App Server (USA) → Database (USA)
User (Europe) → App Server (Europe) → Database (Europe)
User (Asia) → App Server (Asia) → Database (Asia)

Benefits:
- Low latency everywhere
- Local resilience
- Better user experience

Challenges:
- Data consistency across regions
- Complexity: multiple database replicas
- Cost: multiple data centers
```

**Data Replication Across Regions:**
```
Primary DB (USA)
    ↓ replication
Replica DB (Europe) - asynchronous, lag possible
Replica DB (Asia) - asynchronous, lag possible

Reads: hit local replica
Writes: must go to primary (eventual consistency)
```

#### 4. Hybrid Approach (Most Common)
```
Static content → CDN edge servers (fast, cheap)
Dynamic content → Regional app servers (consistent, performant)

Cost-effective: CDN handles 80% of traffic (static)
Performance: Dynamic content from nearby region
Consistency: Can replicate write-once, read-many

Example: Static image CDN + regional API servers
```

### Real-World Example

**Netflix:**
- Uses CDN extensively for video content
- Streams to nearest regional CDN
- Has its own CDN (Open Connect) for cost savings
- Uses regional caches + CDN tiers
- Result: millions of simultaneous streams, minimal latency

**Interview Scenario:**
> "Design video streaming service for global users"
>
> **Good Answer:** "I'd use a multi-layer approach: Origin servers store masters in US. Regional CDN replicates popular content (top 1000 videos). User videos cached at CDN edge closest to them. Cache-Control headers: 1 year for videos (never change), 1 hour for video list (changes when published). Dynamic content (comments, recommendations) from regional API servers. Content gets pushed to CDN during off-peak hours."

### Common Follow-Up Questions

1. **"How do you choose TTL (time-to-live) for cached content?"**
   - Static assets: 1 year (never changes, version in URL)
   - Homepage: 1 hour (changes when content published)
   - API responses: 5 minutes (balance freshness and cache)
   - User data: 0 (never cache, except with auth cache-key)

2. **"What if you need to update cached content immediately?"**
   - Purge API: CDN provides endpoint to invalidate
   - Cost: many purges expensive
   - Better: version in URL (image-v2.jpg instead of image.jpg)
   - Or: short TTL if freshness critical

3. **"How do CDNs handle SSL/HTTPS?"**
   - CDN has certificate for their domain
   - Origin has certificate for your domain
   - Two connections: client→CDN (client cert), CDN→origin (origin cert)
   - Transparent to user

4. **"How does CDN know if you're in USA vs Europe?"**
   - GeoIP: IP address mapped to geographic location
   - BGP anycast: same domain, user connects to nearest server
   - DNS: returns different IPs based on user location

5. **"What's the difference between push and pull CDN?"**
   - Pull: Content fetched on-demand (lazy)
   - Push: You upload content to CDN (active)
   - Pull: easier, automatic
   - Push: control over what's cached, for critical content

---

## Monitoring and Logging

### Definition and Why It Matters

**Monitoring** is observing system health and performance in real-time. **Logging** is recording events for debugging and analysis. Together they're essential because:
- Systems fail silently without monitoring
- Can't debug issues without logs
- Enables understanding of performance problems
- Required for SLA compliance
- Critical for incident response

**Pyramid of Observability:**
```
         Alerts (smallest, most critical)
        ↗↖
      Metrics
     ↗↖
   Logs
  ↗↖
Events (largest, most data)
```

### Three Pillars of Observability

#### 1. Logs
- **What:** Detailed record of events
- **Example:**
  ```
  2026-01-29 10:45:23.456 [INFO] User 1234 logged in from 192.168.1.1
  2026-01-29 10:45:24.789 [ERROR] Database connection failed, retry 1/3
  2026-01-29 10:45:25.012 [DEBUG] Cache hit for key "user:1234:profile"
  ```
- **Use:** Debug specific incidents
- **Challenge:** Log volume can be huge
- **Best Practices:**
  - Structured logging (JSON, key-value pairs)
  - Include request ID for tracing across services
  - Appropriate log levels (DEBUG, INFO, WARN, ERROR)

#### 2. Metrics
- **What:** Quantified measurements over time
- **Example:**
  ```
  cpu_usage: 75%
  memory_usage: 4.2GB / 8GB
  requests_per_second: 1,250
  error_rate: 0.1%
  latency_p99: 150ms (99th percentile)
  ```
- **Use:** Trend analysis, alerting, capacity planning
- **Types:**
  - Counter: only increases (requests served, errors)
  - Gauge: can go up/down (CPU, memory)
  - Histogram: distribution (request latencies)

#### 3. Traces
- **What:** Request journey through system
- **Example:**
  ```
  Request ID: req-12345
  → API Server (2ms)
    → Authentication (5ms)
    → Database Query (50ms)
    → Cache Lookup (1ms)
  Total: 58ms
  ```
- **Use:** Understand where time is spent
- **Challenges:** Overhead of tracing, high data volume

### Key Metrics to Monitor

#### Application Level

**Availability:**
```
Uptime = (1 - total_downtime / total_time) * 100%
SLA target: 99.9% (allows ~43 minutes downtime/month)
SLA target: 99.99% (allows ~4 minutes downtime/month)
```

**Latency:**
```
Response time percentiles:
- p50 (median): 50th percentile - typical user experience
- p95: 95% of users see at least this fast
- p99: 99% of users see at least this fast
- p99.9: extreme outliers

Example: p99 = 500ms means 1% of users wait > 500ms
```

**Throughput:**
```
Requests per second (RPS/QPS)
Transactions per second
Connections per second
```

**Error Rate:**
```
Percentage of requests that fail
Track by: error type, endpoint, service
Alert if: error_rate > 1% (or your SLA)
```

**Examples:**
```
Latency p95: 100ms (alert if > 200ms)
Error rate: 0.05% (alert if > 1%)
QPS: 10,000 (alert if approaching max capacity)
```

#### Infrastructure Level

**CPU:**
```
Usage: percentage utilized
Alert if: > 80% for sustained time
Action: might need to add more servers
```

**Memory:**
```
Usage: percentage used
Alert if: > 85%
Problem: OOM killer might terminate process
```

**Disk:**
```
Usage: percentage full
I/O: read/write throughput
Alert if: I/O wait too high (process waiting for disk)
```

**Network:**
```
Bandwidth: bytes in/out per second
Connections: TCP connections, connection state
Alert if: approaching network capacity
```

### Logging Best Practices

#### 1. Structured Logging
**Bad:**
```
User logged in successfully
```

**Good:**
```json
{
  "timestamp": "2026-01-29T10:45:23.456Z",
  "level": "INFO",
  "event": "user_login",
  "user_id": 1234,
  "ip_address": "192.168.1.1",
  "request_id": "req-12345",
  "session_duration_ms": 45000
}
```

**Benefits:**
- Parseable by machines
- Can query by field
- Easy to aggregate
- Tools: ELK Stack, Splunk, DataDog

#### 2. Request Tracing
```
When request enters system:
1. Generate unique request ID
2. Pass to all services involved
3. Each service logs with request ID
4. Can reconstruct full journey
```

**Example:**
```
Request ID: req-abc123 travels through:
API Gateway logs: request_id=req-abc123, received request
Auth Service logs: request_id=req-abc123, validated token
Database logs: request_id=req-abc123, executed query
Response logs: request_id=req-abc123, returning 200ms response
```

#### 3. Log Levels
```
DEBUG: developer debugging info, verbose
INFO: important business events, deployments
WARN: abnormal but recoverable situations
ERROR: errors that need attention but don't stop system
FATAL: system cannot continue

Production: typically INFO and above (too much DEBUG overhead)
```

#### 4. Sensitive Data
**Never log:**
```
Passwords, API keys, credit cards, PII
```

**If needed:**
```
Log hash of password (not password)
Log last 4 digits only (not full credit card)
Log user ID (not email/name if possible)
```

### Alerting Strategy

#### Types of Alerts

**Threshold Alerts:**
```
if cpu_usage > 80% for 5 minutes → alert
if error_rate > 1% → alert
if latency_p99 > 500ms → alert
```

**Anomaly Detection:**
```
if cpu_usage suddenly spikes 3x normal → alert
if error rate changes 10x normal → alert
Machine learning detects unusual patterns
```

**Composite Alerts:**
```
if error_rate > 1% AND latency_p99 > 1000ms → alert
(both conditions indicate serious problem)
```

#### Alert Fatigue
**Problem:** Too many alerts → ignored by ops team

**Solution:**
- Alert on what matters (not everything)
- Use thresholds that reduce noise
- Correlate related metrics
- Alert on actual problems, not warnings
- Example: alert on p99 latency, not average (average less meaningful)

### Tools and Stack

#### Logging Stack
- **Log Collection:**
  - Fluentd: collects logs from all services
  - Logstash: transforms and filters logs
  - Filebeat: lightweight log shipper
- **Log Storage:** Elasticsearch (searchable), S3 (archive)
- **Log Analysis:** Kibana (visualization), Grafana (dashboards)
- **Cloud Options:** DataDog, Splunk, New Relic

#### Metrics Stack
- **Collection:** Prometheus (time-series database)
- **Visualization:** Grafana (dashboards)
- **Alerting:** Prometheus AlertManager
- **Cloud Options:** DataDog, New Relic, CloudWatch (AWS)

#### Tracing Stack
- **Collection:** Jaeger, Zipkin
- **Visualization:** See trace waterfall
- **Cloud Options:** DataDog APM, New Relic APM

### Real-World Example

**Google's SRE Practices:**
- Golden signals: latency, traffic, errors, saturation
- Monitor every service's 4 golden signals
- Alert on symptoms (bad response time) not causes (high CPU)
- Error budgets: allowed downtime per SLA
- Post-mortems: after outages, understand root cause

**Interview Scenario:**
> "How would you debug why your user-facing API is slow for 5% of users?"
>
> **Good Answer:** "First, I'd check metrics: is p99 latency high? Then I'd look at logs: check error rates, trace specific slow requests using request IDs. Check infrastructure: is CPU/memory bottleneck? Examine distributed traces: where is time spent - auth, database, external APIs? Look for patterns: specific user types, geographic regions, or times when slow. Create monitoring: add alerts on p99 latency and error spikes. Add custom metrics to track business logic performance (e.g., database query time)."

### Common Follow-Up Questions

1. **"What SLA would you set?"**
   - 99.9% (3 nines) = ~43 min downtime/month
   - 99.99% (4 nines) = ~4 min downtime/month
   - 99.999% (5 nines) = ~26 seconds downtime/month
   - Choose based on cost vs business need

2. **"How do you avoid alert fatigue?"**
   - Alert on actual problems, not warnings
   - Use high thresholds
   - Correlate metrics (only alert if multiple bad)
   - Disable non-critical alerts during known maintenance

3. **"How long should you keep logs?"**
   - Recent logs (1-3 months): fast access, hot storage
   - Historical logs (3-12 months): archive storage (cheaper)
   - Compliance: some data 7+ years
   - Cost: storage is major expense

4. **"How do you monitor third-party services?"**
   - Synthetic monitoring: periodic requests to check health
   - Example: every minute, call API and measure response
   - Status page monitoring: check published status
   - Alerting: get notified if external service down

5. **"What metrics matter most for your service?"**
   - Depends on service type
   - E-commerce: error rate, payment success rate
   - Streaming: buffering ratio, startup time
   - Social media: engagement metrics, load time
   - Always: latency, availability, error rate

---

## Summary and Key Takeaways

### Core Principle
Every system design involves tradeoffs. Choose based on requirements:

| Problem | Solution | Tradeoff |
|---------|----------|----------|
| Too slow? | Caching, CDN | Consistency |
| Too much traffic? | Load balancing, sharding | Complexity |
| Not available? | Replication, failover | Cost |
| Hard to debug? | Logging, monitoring | Data volume |
| Too complex? | Microservices | Operational overhead |

### Interview Preparation Checklist

**Know These Cold:**
- [ ] Horizontal vs vertical scaling
- [ ] Types of load balancing algorithms
- [ ] Cache-aside vs write-through strategies
- [ ] SQL vs NoSQL tradeoffs
- [ ] CAP theorem and when to choose each option
- [ ] Message queue vs direct calls
- [ ] CDN when and why
- [ ] Golden signals for monitoring

**Practice Explaining:**
- [ ] Design a 10M user system
- [ ] Scale from 1K to 1M QPS
- [ ] Handle failure of critical component
- [ ] Reduce latency for geo-distributed users
- [ ] Design complex workflow (payments, orders)

**Have Ready:**
- [ ] Real examples from your projects
- [ ] Tradeoff analysis (why not other options)
- [ ] Failure scenarios (what if X fails)
- [ ] Cost considerations
- [ ] Monitoring strategy

### Quick Decision Trees

**For Scaling:**
```
Too slow?
├─ Response time bad?
│  ├─ Yes → Caching, indexing
│  └─ No → Skip
└─ Throughput bad?
   ├─ Yes → Load balancing, horizontal scaling
   └─ No → You're fine
```

**For Database:**
```
Complex relationships?
├─ Yes → SQL (PostgreSQL)
└─ No, flat data?
   ├─ Read-heavy → NoSQL key-value (DynamoDB)
   ├─ Write-heavy → Cassandra, MongoDB
   └─ Text search → Elasticsearch
```

**For Consistency:**
```
Must never lose data?
├─ Yes → Write-through, sync replication
└─ No, eventual okay?
   ├─ Yes → Write-behind, async replication
   └─ Depends → Quorum reads/writes
```

---

**This guide is designed for interactive learning. Questions to test yourself:**

1. Why would you choose NoSQL over SQL? (Hint: tradeoffs)
2. What's difference between CDN caching my webpage vs database cache?
3. How would CAP theorem apply if your database replicates across continents?
4. Design a system where some users see ads (easy to cache) and others see personalized content (hard to cache)
5. If your load balancer fails, what happens? How would you prevent total outage?

Remember: System design is about understanding tradeoffs and making informed decisions based on requirements.
