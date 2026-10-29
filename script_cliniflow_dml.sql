-- 1. Inserções de Dados (INSERT)
INSERT INTO especialidade (nome) VALUES ('Odontologia Geral'), ('Cardiologia');

INSERT INTO paciente (nome, cpf, telefone, data_nascimento) VALUES 
('Maria Silva', '12345678901', '71988887777', '1990-05-15'),
('João Souza', '98765432100', '71999998888', '1985-10-20');

INSERT INTO profissional (nome, registro_conselho, id_especialidade) VALUES 
('Dra. Ana Costa', 'CRO-BA 12345', 1),
('Dr. Carlos Lima', 'CRM-BA 67890', 2);

INSERT INTO agendamento (data_hora, status, id_paciente, id_profissional) VALUES 
('2026-11-10 09:00:00', 'AGENDADO', 1, 1),
('2026-11-10 10:30:00', 'AGENDADO', 2, 2);

-- 2. Atualização de Dados (UPDATE)
UPDATE agendamento 
SET status = 'CONCLUIDO' 
WHERE id_agendamento = 1;

-- Inserção do prontuário após conclusão da consulta
INSERT INTO prontuario (descricao, prescricao, id_agendamento) 
VALUES ('Paciente realizou limpeza preventiva.', 'Uso de fio dental diário e enxaguante.', 1);

-- 3. Remoção de Dados (DELETE)
DELETE FROM agendamento 
WHERE id_agendamento = 2 AND status = 'CANCELADO';

-- 4. Consultas com Junções e Filtros (SELECT com JOIN)
SELECT 
    a.id_agendamento,
    a.data_hora,
    p.nome AS paciente,
    prof.nome AS profissional,
    e.nome AS especialidade,
    a.status
FROM agendamento a
INNER JOIN paciente p ON a.id_paciente = p.id_paciente
INNER JOIN profissional prof ON a.id_profissional = prof.id_profissional
INNER JOIN especialidade e ON prof.id_especialidade = e.id_especialidade
ORDER BY a.data_hora ASC;