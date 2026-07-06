package com.example.template.application.auth;

public interface AuthService {

    AuthResult login(LoginCommand command);
}
