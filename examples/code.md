# 💻 Code & Syntax Highlighting

This file tests how `inlyne` handles various programming languages and syntax highlighting themes.

---

## 🦀 Rust

```rust
#[derive(Debug)]
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

fn main() {
    let user1 = User {
        email: String::from("someone@example.com"),
        username: String::from("someusername123"),
        active: true,
        sign_in_count: 1,
    };
    println!("User: {:?}", user1);
}
```

---

## 🐍 Python

```python
import asyncio

async def say_after(delay, what):
    await asyncio.sleep(delay)
    print(what)

async def main():
    print(f"started at {time.strftime('%X')}")
    await asyncio.gather(
        say_after(1, 'hello'),
        say_after(2, 'world')
    )
    print(f"finished at {time.strftime('%X')}")

if __name__ == "__main__":
    asyncio.run(main())
```

---

## 📜 TypeScript / React

```tsx
import React, { useState } from 'react';

const Counter: React.FC = () => {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
};
```

---

## 🐳 Dockerfile

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

---

## 🐚 Shell

```bash
#!/bin/bash

# A simple script to backup a directory
SOURCE="/home/user/documents"
DEST="/home/user/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

tar -czf "$DEST/backup_$TIMESTAMP.tar.gz" "$SOURCE"
echo "Backup completed successfully!"
```
