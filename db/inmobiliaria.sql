-- Database: inmobiliaria
CREATE DATABASE inmueble;

USE inmueble;
-- Creación de la tabla Clientes
CREATE TABLE Clientes (
    id_cli INT PRIMARY KEY,
    pnombre_cli VARCHAR(50),
    snombre_cli VARCHAR(50),
    papellido_cli VARCHAR(50),
    sapellido_cli VARCHAR(50),
    correo_cli VARCHAR(100),
    estado_civil_cli VARCHAR(20),
    direccion_cli VARCHAR(100),
    num_telefono_cli VARCHAR(20)
);

-- Creación de la tabla Imuebles
CREATE TABLE Imuebles (
    id_imu INT PRIMARY KEY, -- AUTO_INCREMENT,
    nombre_imu VARCHAR(100),
    direccion_imu VARCHAR(100),
    codigoPostal_imu VARCHAR(10),
    descripcion_imu TEXT,
    precio_imu DECIMAL(10,2),
    fk_id_cli INT,
    FOREIGN KEY (fk_id_cli) REFERENCES Clientes(id_cli)
);

-- Creación de la tabla Fiadores
CREATE TABLE Fiadores (
    id_fia INT  PRIMARY KEY ,-- AUTO_INCREMENT
    pnombre_fia VARCHAR(50),
    snombre_fia VARCHAR(50),
    papellido_fia VARCHAR(50),
    sapellido_fia VARCHAR(50),
    correo_fia VARCHAR(100),
    num_telefono_fia VARCHAR(20)
);


-- Insertar registros en la tabla Clientes
INSERT INTO Clientes (id_cli, pnombre_cli, snombre_cli, papellido_cli, sapellido_cli, correo_cli, estado_civil_cli, direccion_cli, num_telefono_cli) VALUES
(1, 'Juan', 'Carlos', 'García', 'Pérez', 'juan@gmail.com', 'Casado', 'Calle 123', '1234567890'),
(2, 'María', 'Luisa', 'Martínez', 'Gómez', 'maria@gmail.com', 'Soltera', 'Avenida 456', '9876543210'),
(3, 'Pedro', '', 'Díaz', '', 'pedro@gmail.com', 'Divorciado', 'Carrera 789', '4567890123'),
(4, 'Ana', '', 'Fernández', '', 'ana@gmail.com', 'Casada', 'Avenida 789', '3210987654'),
(5, 'Laura', 'Valentina', 'López', 'González', 'laura@gmail.com', 'Soltera', 'Calle 456', '7890123456');

-- Insertar registros en la tabla Imuebles
INSERT INTO Imuebles (nombre_imu, direccion_imu, codigoPostal_imu, descripcion_imu, precio_imu, fk_id_cli) VALUES
('Casa de campo', 'Calle 123', '12345', 'Hermosa casa con jardín', 200000.00, 1),
('Apartamento céntrico', 'Avenida 456', '45678', 'Apartamento en el corazón de la ciudad', 150000.00, 2),
('Casa en la playa', 'Carrera 789', '78901', 'Casa con vista al mar', 300000.00, NULL),
('Piso en urbanización', 'Avenida 789', '89012', 'Piso con todas las comodidades', 180000.00, NULL),
('Chalet con piscina', 'Calle 456', '45678', 'Chalet con piscina privada', 250000.00, 5);

-- Insertar registros en la tabla Fiadores
INSERT INTO Fiadores (pnombre_fia, snombre_fia, papellido_fia, sapellido_fia, correo_fia, num_telefono_fia) VALUES
('Ricardo', '', 'Gutiérrez', '', 'ricardo@gmail.com', '1234567890'),
('Sofía', 'Alejandra', 'Hernández', 'Martínez', 'sofia@gmail.com', '9876543210'),
('Jorge', '', 'Ramírez', '', 'jorge@gmail.com', '4567890123'),
('Karina', '', 'Alvarez', '', 'karina@gmail.com', '3210987654'),
('Daniel', '', 'Pérez', '', 'daniel@gmail.com', '7890123456');
