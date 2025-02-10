package com.eilco.ecommerce.service;

import com.eilco.ecommerce.model.entities.Login;
import com.eilco.ecommerce.repository.LoginRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class LoginService {

    @Autowired
    private LoginRepository loginRepository;

    public Login createLogin(Login login) {
        return loginRepository.save(login);
    }

    public Optional<Login> getLoginById(Long id) {
        return loginRepository.findById(id);
    }
    public Optional<Login> getLoginByUsername(String username) {
        return loginRepository.findByUsername(username);
    }

    public Login updateLogin(Long id, Login updatedLogin) {
        return loginRepository.findById(id)
                .map(existingLogin -> {
                    existingLogin.setUsername(updatedLogin.getUsername());
                    existingLogin.setPassword(updatedLogin.getPassword());
                    return loginRepository.save(existingLogin);
                }).orElseThrow(() -> new ResourceNotFoundException("Login not found with id " + id));
    }
    public boolean isUsernameTaken(String username) {
        return loginRepository.findByUsername(username).isPresent();
    }

}
