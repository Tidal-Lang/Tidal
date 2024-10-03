use std::str::Chars;
use std::iter::Peekable;

#[derive(Debug, PartialEq, Clone)]
pub enum Token {
    Var,
    NoVar,
    Print,
    Identifier(String),
    Number(i32),
    Plus,
    Minus,
    Multiply,
    Divide,
    Assign,
    Semicolon,
    LParen,
    RParen,
    Null,
    EOF,
}

pub struct Lexer<'a> {
    input: Peekable<Chars<'a>>,
}

impl<'a> Lexer<'a> {
    pub fn new(input: &'a str) -> Self {
        Lexer {
            input: input.chars().peekable(),
        }
    }

    pub fn next_token(&mut self) -> Token {
        self.skip_whitespace();

        match self.input.next() {
            Some(ch) => match ch {
                '0'..='9' => self.read_number(ch),
                '+' => Token::Plus,
                '-' => Token::Minus,
                '*' => Token::Multiply,
                '/' => Token::Divide,
                '=' => Token::Assign,
                ';' => Token::Semicolon,
                '(' => Token::LParen,
                ')' => Token::RParen,
                'a'..='z' | 'A'..='Z' | '_' => self.read_identifier(ch),
                _ => panic!("Unexpected character: {}", ch),
            },
            None => Token::EOF,
        }
    }

    fn read_number(&mut self, first_digit: char) -> Token {
        let mut number = first_digit.to_string();
        while let Some(&ch) = self.input.peek() {
            if ch.is_digit(10) {
                number.push(ch);
                self.input.next();
            } else {
                break;
            }
        }
        Token::Number(number.parse().unwrap())
    }

    fn read_identifier(&mut self, first_char: char) -> Token {
        let mut identifier = first_char.to_string();
        while let Some(&ch) = self.input.peek() {
            if ch.is_alphanumeric() || ch == '_' {
                identifier.push(ch);
                self.input.next();
            } else {
                break;
            }
        }
        match identifier.as_str() {
            "var" => Token::Var,
            "novar" => Token::NoVar,
            "print" => Token::Print,
            "null" => Token::Null,
            _ => Token::Identifier(identifier),
        }
    }

    fn skip_whitespace(&mut self) {
        while let Some(&ch) = self.input.peek() {
            if ch.is_whitespace() {
                self.input.next();
            } else {
                break;
            }
        }
    }
}