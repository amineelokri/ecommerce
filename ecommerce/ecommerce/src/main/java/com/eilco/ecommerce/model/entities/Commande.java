package com.eilco.ecommerce.model.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    @Entity
    @Table(name = "commande")
public class Commande {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(nullable = false)
        private LocalDate date;

        @ManyToOne
        @JoinColumn(name = "login_id", nullable = false)
        private Login user;

        @ManyToMany
        @JoinTable(
                name = "commande_product",
                joinColumns = @JoinColumn(name = "commande_id"),
                inverseJoinColumns = @JoinColumn(name = "product_id")
        )
        private List<Product> products;

    }

