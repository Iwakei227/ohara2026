-- 図書貸出システム
-- 元資料：エンティティ定義書(図書貸出システム).xlsx
-- 文字コード：utf8mb4
-- ストレージエンジン：InnoDB
--
-- 注意：
-- students テーブルの学生番号の物理名は、
-- 元の定義書どおり「sutudent_no」です。

SET NAMES utf8mb4;

-- 本
CREATE TABLE IF NOT EXISTS `books` (
    `book_id` INT NOT NULL,
    `title` VARCHAR(200) NOT NULL,
    `author` VARCHAR(100) NOT NULL,
    `genre` VARCHAR(50) NOT NULL,
    `description` TEXT NULL,
    PRIMARY KEY (`book_id`)
) ENGINE=InnoDB
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- 学生
CREATE TABLE IF NOT EXISTS `students` (
    `sutudent_no` VARCHAR(20) NOT NULL,
    `student_name` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`sutudent_no`)
) ENGINE=InnoDB
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- 貸出
CREATE TABLE IF NOT EXISTS `loans` (
    `loan_id` INT NOT NULL,
    `student_no` VARCHAR(20) NOT NULL,
    `book_id` INT NOT NULL,
    `loan_date` DATE NOT NULL,
    `due_date` DATE NOT NULL,
    `return_date` DATE NULL,
    PRIMARY KEY (`loan_id`),
    CONSTRAINT `fk_loans_books`
        FOREIGN KEY (`book_id`)
        REFERENCES `books` (`book_id`),
    CONSTRAINT `fk_loans_students`
        FOREIGN KEY (`student_no`)
        REFERENCES `students` (`sutudent_no`)
) ENGINE=InnoDB
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
