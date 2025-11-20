CREATE TABLE service (
    id INTEGER PRIMARY KEY,
    status TEXT DEFAULT 'aguardando',
    description TEXT,
    customer TEXT NOT NULL,
    title TEXT NOT NULL,
    observation TEXT,
    started_at TEXT,    
    finished_at TEXT 
);