# flu_fire

Just a simple integration with Firebase

## Cloud Firestore

Relational vs. NoSQL

### Relational

- Schema
- Tables with columns
- Foreign keys
- Assemble data on query

### NoSQL

- No schema
- Nested key-value documents (like JSON)
- Self-contained
- Duplicate data to document (duplication???)
  - Optimize reads instead of writes
  - Write: overhead to sync
  - Read: everything is ready
  - In most application, reads are more frequent than writes

### Cloud Firestore

- NoSQL
- Collections
- Sub-collections
