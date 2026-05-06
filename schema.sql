-- Crear la tabla de respuestas SUS
CREATE TABLE IF NOT EXISTS sus_responses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Respuestas (1-5)
    q1 INTEGER NOT NULL CHECK (q1 >= 1 AND q1 <= 5),
    q2 INTEGER NOT NULL CHECK (q2 >= 1 AND q2 <= 5),
    q3 INTEGER NOT NULL CHECK (q3 >= 1 AND q3 <= 5),
    q4 INTEGER NOT NULL CHECK (q4 >= 1 AND q4 <= 5),
    q5 INTEGER NOT NULL CHECK (q5 >= 1 AND q5 <= 5),
    q6 INTEGER NOT NULL CHECK (q6 >= 1 AND q6 <= 5),
    q7 INTEGER NOT NULL CHECK (q7 >= 1 AND q7 <= 5),
    q8 INTEGER NOT NULL CHECK (q8 >= 1 AND q8 <= 5),
    q9 INTEGER NOT NULL CHECK (q9 >= 1 AND q9 <= 5),
    q10 INTEGER NOT NULL CHECK (q10 >= 1 AND q10 <= 5),
    
    -- Cálculos
    final_score NUMERIC(5, 2) NOT NULL,
    interpretation TEXT NOT NULL
);

-- Habilitar RLS (Row Level Security)
ALTER TABLE sus_responses ENABLE ROW LEVEL SECURITY;

-- Política para permitir que cualquier persona inserte datos (público)
CREATE POLICY "Permitir inserciones públicas" 
ON sus_responses FOR INSERT 
WITH CHECK (true);

-- Política para que solo el admin pueda leer los datos
-- Nota: Esto asume que el admin se loguea en Supabase.
-- Si prefieres algo más simple por ahora, puedes habilitar lectura pública o usar service_role.
CREATE POLICY "Permitir lectura solo a autenticados" 
ON sus_responses FOR SELECT 
USING (auth.role() = 'authenticated');
