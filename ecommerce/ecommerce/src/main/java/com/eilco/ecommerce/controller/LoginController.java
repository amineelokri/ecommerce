package com.eilco.ecommerce.controller;

import com.eilco.ecommerce.model.entities.Login;
import com.eilco.ecommerce.service.LoginService;
import com.eilco.ecommerce.dto.LoginResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/login")
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<LoginResponse> createLogin(@RequestBody Login login) {
        Login createdLogin = loginService.createLogin(login);
        LoginResponse response = LoginResponse.builder().login(createdLogin).build();
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Login> getLoginById(@PathVariable Long id) {
        Optional<Login> login = loginService.getLoginById(id);
        return login.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("/username/{username}")
    public ResponseEntity<Login> getLoginByUsername(@PathVariable String username) {
        Optional<Login> login = loginService.getLoginByUsername(username);
        return login.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Login> updateLogin(@PathVariable Long id, @RequestBody Login updatedLogin) {
        try {
            Login login = loginService.updateLogin(id, updatedLogin);
            return ResponseEntity.ok(login);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/exists/{username}")
    public boolean isUsernameTaken(@PathVariable("username") String username) {
        return loginService.isUsernameTaken(username);
    }

}
