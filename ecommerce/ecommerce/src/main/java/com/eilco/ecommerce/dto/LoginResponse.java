package com.eilco.ecommerce.dto;

import com.eilco.ecommerce.model.entities.Login;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@AllArgsConstructor
@Data
@Builder
public class LoginResponse {
    Login login;
}
