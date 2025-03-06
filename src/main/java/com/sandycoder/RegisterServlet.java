package com.sandycoder;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RegisterServlet {

    @GetMapping("/register")
    public String register(@RequestParam String fullname, @RequestParam String email) {
        return "<h2>Registration Successful!</h2>"
                + "<p>Name: " + fullname + "</p>"
                + "<p>Email: " + email + "</p>";
    }
}