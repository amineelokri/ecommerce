package com.eilco.ecommerce.service;

import com.eilco.ecommerce.model.entities.Commande;
import com.eilco.ecommerce.model.entities.Product;
import com.eilco.ecommerce.repository.CommandeRepository;
import com.eilco.ecommerce.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CommandeService {

    private final CommandeRepository commandeRepository;
    private final ProductRepository productRepository;

    @Transactional
    public Commande save(Commande commande) {
        validateProductQuantities(commande);
        updateProductQuantities(commande);
        return commandeRepository.save(commande);
    }

    public Optional<Commande> findById(Long id) {
        return commandeRepository.findById(id);
    }

    public List<Commande> findAll() {
        return commandeRepository.findAll();
    }

    public List<Commande> findByUserId(Long userId) {
        return commandeRepository.findByUserId(userId);
    }

    @Transactional
    public Commande update(Long id, Commande updatedCommande) {
        return commandeRepository.findById(id)
                .map(existingCommande -> {
                    validateProductQuantities(updatedCommande);
                    restoreProductQuantities(existingCommande);
                    updateProductQuantities(updatedCommande);
                    existingCommande.setDate(updatedCommande.getDate());
                    existingCommande.setUser(updatedCommande.getUser());
                    existingCommande.setProducts(updatedCommande.getProducts());

                    return commandeRepository.save(existingCommande);
                })
                .orElseThrow(() -> new RuntimeException("Commande not found with ID: " + id));
    }

    @Transactional
    public void deleteById(Long id) {
        commandeRepository.findById(id).ifPresent(this::restoreProductQuantities);
        commandeRepository.deleteById(id);
    }

    private void validateProductQuantities(Commande commande) {
        for (Product product : commande.getProducts()) {
            long requestedQuantity = commande.getProducts().stream()
                    .filter(p -> p.getId().equals(product.getId()))
                    .count();

            if (product.getQuantity() < requestedQuantity) {
                throw new RuntimeException("Insufficient stock for product: " + product.getName() +
                        ". Available: " + product.getQuantity() + ", Requested: " + requestedQuantity);
            }
        }
    }

    private void updateProductQuantities(Commande commande) {
        for (Product product : commande.getProducts()) {
            long requestedQuantity = commande.getProducts().stream()
                    .filter(p -> p.getId().equals(product.getId()))
                    .count();

            product.setQuantity((int) (product.getQuantity() - requestedQuantity));
            productRepository.save(product);
        }
    }

    private void restoreProductQuantities(Commande commande) {
        for (Product product : commande.getProducts()) {
            long requestedQuantity = commande.getProducts().stream()
                    .filter(p -> p.getId().equals(product.getId()))
                    .count();
            product.setQuantity((int) (product.getQuantity() + requestedQuantity));
            productRepository.save(product);
        }
    }
}
