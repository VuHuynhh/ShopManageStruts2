/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Dell
 */
public class Cart implements Serializable {

    private Map<ProductDTO, Integer> items;

    public Cart() {
    }

    public Map<ProductDTO, Integer> getItems() {
        return items;
    }

    public void setItems(Map<ProductDTO, Integer> items) {
        this.items = items;
    }
    
    public void addItemToCart(ProductDTO product) {
        if (this.items == null) {
            items = new HashMap<>();
        }
        int quantity = 1;
        if (this.items.containsKey(product)) {
            quantity = this.items.get(product) + 1;
        }
        this.items.put(product, quantity);
    }

    public void deleteItemFromCart(String productId) {
        if (this.items == null) {
            return;
        }
        ProductDTO dto = null;
        for (ProductDTO product : items.keySet()) {
            if (product.getId().equals(productId)) {
                dto = product;
            }
        }
        if (items != null) {
            this.items.remove(dto);
            if (items.isEmpty()) {
                items = null;
            }
        }
    }

    public void updateItemFromCart(String id, int quantity) {
        ProductDTO dto = null;
        for (ProductDTO product : items.keySet()) {
            if (product.getId().equals(id)) {
                dto = product;
            }
        }
        if (this.items.containsKey(dto)) {
            this.items.put(dto, quantity);
        }
    }

    public double getTotal(int quantity, double price) {
        double total = 0;   
        for (ProductDTO dto : items.keySet()) {        
            dto.setPrice(price);
            dto.setQuantity(quantity);
            total += dto.getPrice() * dto.getQuantity();
        }
        return total;
    }
    
    public double getTotal() {
        double price = 0;
        for (ProductDTO dto : items.keySet()) {
            price  += items.get(dto) * dto.getPrice();
        }
        return price;
    }

}
