# MS Teams Clone - Real-Time Communication Platform

## Project Overview

**Status:** Functional | **Deployment:** Railway (Cloud)

A full-stack real-time video and chat communication platform inspired by Microsoft Teams. The project demonstrates proficiency in full-stack development, real-time communication protocols, database design, and production deployment.

## Project Details

### Technology Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | HTML5, CSS3, JavaScript (WebRTC) |
| **Backend** | Node.js, Express.js |
| **Database** | PostgreSQL (Neon) |
| **Authentication** | Google OAuth 2.0 |
| **Real-Time Communication** | WebSocket, WebRTC |
| **TURN Server** | Metered.ca (TURN Credentials API) |
| **Deployment** | Railway |
| **Session Management** | Express Sessions |
| **ORM** | Sequelize |

### Architecture

```
User Interface (HTML/CSS/JS)
    ↓
Express.js REST API
    ↓
Sequelize ORM
    ↓
PostgreSQL Database (Neon)

WebSocket Connection (Real-time)
    ↓
Signaling Server (Node.js)
    ↓
WebRTC Peer Connections
    ↓
STUN/TURN Servers (Metered.ca)
    ↓
Video/Audio Streams
```

### Key Features

#### 1. **User Authentication**
- Google OAuth 2.0 integration
- Session-based authentication
- Persistent user sessions
- Cookie-based session management

#### 2. **Real-Time Video Calling**
- WebRTC peer-to-peer connections
- Multi-user video conferencing
- STUN/TURN server configuration for NAT traversal
- Video stream management
- User video indicators

#### 3. **Messaging System**
- Real-time chat functionality
- Message persistence in database
- User presence indicators
- Message history

#### 4. **Responsive Design**
- Mobile-responsive UI
- Desktop optimization
- Video player controls
- UI improvements for better UX

### Core Functionalities

#### Video Conferencing
- Initialize WebRTC connections
- Offer/Answer negotiation
- ICE candidate gathering
- Remote stream handling
- Multiple peer management

#### Session Management
- User registration/login
- Session persistence
- OAuth callback handling
- Secure credential storage

#### Database Design
- User profiles
- Call logs
- Message history
- Session tracking
- Room/group management

### Challenges & Solutions

| Challenge | Solution | Learning |
|-----------|----------|----------|
| Video not showing cross-device | TURN server configuration (Metered.ca) | NAT traversal, STUN/TURN protocols |
| Mobile responsiveness issues | CSS media queries + responsive design | Mobile-first development |
| OAuth configuration errors | Correct redirect URI setup + environment variables | OAuth 2.0 flow, security best practices |
| Database initialization | Proper env variable setup + connection pooling | Database configuration, Sequelize ORM |
| Multi-user stream management | Proper ICE candidate handling | WebRTC signaling, peer management |
| Session memory leaks | Express session store configuration | Production-grade session management |

### Environment Configuration

Critical environment variables:
- `DATABASE_URL`: PostgreSQL connection string (Neon)
- `GOOGLE_CLIENT_ID`: OAuth client credentials
- `GOOGLE_CLIENT_SECRET`: OAuth secret
- `GOOGLE_CALLBACK_URL`: OAuth redirect URI
- `TURN_API_KEY`: Metered TURN credentials
- `SESSION_SECRET`: Express session encryption

### Deployment Experience

**Platform:** Railway.app
- Container deployment
- Environment variable management
- Port configuration
- Database connectivity
- Production monitoring

### Interview Talking Points

#### Technical Knowledge
- **WebRTC:** Peer-to-peer communication, signaling, ICE candidates
- **OAuth 2.0:** Authentication flow, token management, security
- **WebSocket:** Real-time bidirectional communication
- **Database:** PostgreSQL design, Sequelize ORM, connection pooling
- **Deployment:** Containerization, environment management, production issues

#### Problem-Solving
- Debugging WebRTC connection failures
- Resolving mobile responsive issues
- Fixing OAuth credential mismatches
- Managing database connections in production
- Handling network NAT traversal

#### Scalability Considerations
- Horizontal scaling with multiple servers
- Load balancing for signaling
- Database replication and failover
- WebRTC SFU (Selective Forwarding Unit) vs P2P trade-offs

### Files to Review
- `conversation_history.md` - Complete development and debugging logs
- Platform: Live deployment at `connect-video-app.up.railway.app`

## Resume Snippet

**MS Teams Clone - Real-Time Video Communication Platform**
Developed a full-stack video conferencing application with WebRTC for peer-to-peer video/audio, Express.js backend, PostgreSQL database, and Google OAuth authentication. Implemented STUN/TURN server configuration for NAT traversal, responsive UI for mobile and desktop, and production deployment on Railway. Debugged complex WebRTC issues including multi-device connectivity and stream management.

## What Makes This Interview-Worthy

1. **Full-Stack Competency:** Frontend, backend, database, deployment
2. **Real-Time Systems:** WebRTC, WebSocket, signaling protocols
3. **Production Experience:** Cloud deployment, environment management
4. **Problem-Solving:** Debugging complex networking issues
5. **Authentication:** Secure OAuth implementation
6. **Database:** SQL design and ORM usage

## Potential Interview Questions

- "How does WebRTC establish peer connections?"
- "Explain the role of STUN and TURN servers"
- "How would you scale this to support 1000+ concurrent users?"
- "What are the trade-offs between P2P WebRTC and SFU architecture?"
- "How did you handle authentication in a real-time app?"
- "What challenges did you face with mobile responsiveness?"
