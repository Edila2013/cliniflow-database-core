
-- Tabela de Especialidades
CREATE TABLE especialidade (
    id_especialidade SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de Pacientes
CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    data_nascimento DATE NOT NULL
);

-- Tabela de Profissionais de Saúde
CREATE TABLE profissional (
    id_profissional SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    registro_conselho VARCHAR(20) UNIQUE NOT NULL, -- CRM ou CRO
    id_especialidade INT NOT NULL,
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);

-- Tabela de Agendamentos
CREATE TABLE agendamento (
    id_agendamento SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL,
    status VARCHAR(20) DEFAULT 'AGENDADO' CHECK (status IN ('AGENDADO', 'CONCLUIDO', 'CANCELADO')),
    id_paciente INT NOT NULL,
    id_profissional INT NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente) ON DELETE RESTRICT,
    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional) ON DELETE RESTRICT
);

-- Tabela de Prontuários Eletrônicos
CREATE TABLE prontuario (
    id_prontuario SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    prescricao TEXT,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_agendamento INT UNIQUE NOT NULL,
    FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento)
);    