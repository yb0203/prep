# System Design Core Concepts - Session Notes

## Learning Progress Tracker

Track your understanding as you work through the learning guide.

### Sections Completed
- [ ] Scalability (Horizontal vs Vertical Scaling)
- [ ] Load Balancing (Algorithms and Types)
- [ ] Caching (Strategies and Considerations)
- [ ] Databases (SQL vs NoSQL, Scaling)
- [ ] Distributed Systems (CAP Theorem)
- [ ] Message Queues (Pub/Sub, Event-Driven)
- [ ] CDNs (Geographic Distribution)
- [ ] Monitoring (Logging, Metrics, Alerts)

## Key Concepts to Remember

### Scalability
**Personal Insight:**
(Add here after reading)

**Key Points:**
- [ ] Understand horizontal vs vertical tradeoffs
- [ ] Know why stateless design matters
- [ ] Can explain real-world Netflix example

### Load Balancing
**Personal Insight:**
(Add here after reading)

**Key Points:**
- [ ] Know at least 3 algorithms (round robin, least connections, IP hash)
- [ ] Understand Layer 4 vs Layer 7 differences
- [ ] Can explain health checks

### Caching
**Personal Insight:**
(Add here after reading)

**Key Points:**
- [ ] Know cache-aside vs write-through vs write-behind
- [ ] Understand TTL invalidation vs event-based
- [ ] Remember "there are 2 hard things in CS: cache invalidation and naming"

### Databases
**Personal Insight:**
(Add here after reading)

**Key Points:**
- [ ] Know SQL vs NoSQL decision matrix
- [ ] Understand replication (read scaling) vs sharding (write scaling)
- [ ] Can explain why sharding is complex

### Distributed Systems
**Personal Insight:**
(Add here after reading)

**Key Points:**
- [ ] CAP theorem: consistency, availability, partition tolerance
- [ ] Understand why only 2 of 3 possible
- [ ] Know eventual consistency implications

### Message Queues
**Personal Insight:**
(Add here after reading)

**Key Points:**
- [ ] Know point-to-point vs pub/sub
- [ ] Understand at-least-once delivery and idempotency
- [ ] Can explain when to use (decoupling, load smoothing)

### CDNs
**Personal Insight:**
(Add here after reading)

**Key Points:**
- [ ] Understand how CDNs reduce latency
- [ ] Know what content to cache (static, not dynamic)
- [ ] Understand geo-distribution strategy

### Monitoring
**Personal Insight:**
(Add here after reading)

**Key Points:**
- [ ] Know the 3 pillars: logs, metrics, traces
- [ ] Understand golden signals (latency, traffic, errors, saturation)
- [ ] Know when to alert vs when to ignore

## Questions to Test Understanding

### Scalability
**Q1:** Why would Netflix choose horizontal scaling over vertical?
**My Answer:**
(Write your answer, then check against guide)

**Q2:** What's the database bottleneck with horizontal scaling?
**My Answer:**

### Load Balancing
**Q1:** Why use Layer 7 instead of Layer 4 load balancing?
**My Answer:**

**Q2:** What happens if load balancer fails?
**My Answer:**

### Caching
**Q1:** Why is cache-aside strategy common in web applications?
**My Answer:**

**Q2:** What's the difference between cache-aside and write-through?
**My Answer:**

### Databases
**Q1:** When would you use MongoDB instead of PostgreSQL?
**My Answer:**

**Q2:** Explain the difference between replication and sharding
**My Answer:**

### Distributed Systems
**Q1:** Why can't a distributed system guarantee all of CAP?
**My Answer:**

**Q2:** What's eventual consistency and when is it acceptable?
**My Answer:**

### Message Queues
**Q1:** Why use message queue instead of direct service calls?
**My Answer:**

**Q2:** What does "idempotent" mean for message processing?
**My Answer:**

### CDNs
**Q1:** When shouldn't you use a CDN?
**My Answer:**

**Q2:** How do CDNs handle dynamic, personalized content?
**My Answer:**

### Monitoring
**Q1:** What's the difference between monitoring and logging?
**My Answer:**

**Q2:** Why is alert fatigue a problem?
**My Answer:**

## Real-World Application

### From Your Projects

**Geetha Bay RAG System:**
- Which concepts apply to your Geetha Bay project?
- Caching: (Your answer)
- Database choice: (Your answer)
- Monitoring: (Your answer)

**MS Teams Clone:**
- Which concepts apply to real-time communication?
- Load balancing: (Your answer)
- Message queues: (Your answer)
- Monitoring real-time: (Your answer)

### Interview Application

**Practice Scenarios:**

**Scenario 1:** "Design Instagram feed for 100M users"
Key concepts to use:
- Caching (hot posts)
- CDN (for images)
- Databases (sharding by user)
- Monitoring (latency of feed generation)

**Scenario 2:** "Design payment processing system"
Key concepts to use:
- Consistency (no lost transactions)
- Message queues (async processing)
- Monitoring (error rate is critical)
- Databases (SQL for transactions)

**Scenario 3:** "Design real-time notification system"
Key concepts to use:
- Message queues (pub/sub for events)
- Load balancing (many notification servers)
- Distributed systems (handle network failures)
- Monitoring (delivery rate)

## Weak Areas to Focus On

Based on my learning, I'm least confident in:
1. (Add after assessment)
2. (Add after assessment)
3. (Add after assessment)

**Plan to improve:**
(Add specific study plans)

## Common Interview Questions I Should Prepare

1. Explain the difference between scalability and performance.
2. When would you use NoSQL vs SQL?
3. Design a system that handles 1M requests per second.
4. What's the CAP theorem and how does it apply?
5. How would you scale a database?
6. Explain cache invalidation strategies.
7. What's the difference between a message queue and RPC?
8. How would you monitor a microservices system?
9. Design a geo-distributed system.
10. How would you handle a database failure?

**My answers to these:**
(Add as you prepare)

## Additional Resources

After reading the main guide, here are good follow-ups:
- Deep dive into specific database you want to master (PostgreSQL, MongoDB)
- Study a specific message queue (Kafka internals, RabbitMQ patterns)
- Real case study: How Netflix/Uber/Airbnb uses these patterns
- Practice design interviews: execute designs end-to-end

## Session Summary

**Date Started:** (Add)
**Date Completed:** (Add)
**Total Time Spent:** (Add)
**Confidence Level Before:** (1-10)
**Confidence Level After:** (1-10)

**Key Learnings:**
(Summarize after completing all sections)

**What I'll Focus On Next:**
(Plan your next steps)

**Ready for Interview:** Yes / No
(Mark when ready)
