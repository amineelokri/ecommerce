package com.eilco.ecommerce.dto;

import com.eilco.ecommerce.model.entities.Product;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@AllArgsConstructor
@Data
@Builder
public class ProductResponse {
    Product product;

}
