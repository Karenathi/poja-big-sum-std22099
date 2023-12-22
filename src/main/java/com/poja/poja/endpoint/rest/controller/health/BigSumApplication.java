package com.poja.poja.endpoint.rest.controller.health;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigInteger;

@SpringBootApplication
public class BigSumApplication {
    public static void main(String[] args) {
        SpringApplication.run(BigSumApplication.class, args);
    }
}

@RestController
class BigSumController {

    @RequestMapping("/big-sum")
    public String bigSum(@RequestParam("a") String a, @RequestParam("b") String b) {
        try {
            // Convertir les paramètres en BigInteger
            BigInteger numA = new BigInteger(a);
            BigInteger numB = new BigInteger(b);


            BigInteger result = numA.add(numB);

            return result.toString();
        } catch (NumberFormatException e) {
            return "Erreur: Veuillez fournir des nombres valides.";
        }
    }
}
