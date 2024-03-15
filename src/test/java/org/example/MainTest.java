package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MainTest {
    @Test
    public void testAdd() {
        Main main = new Main();
        assertEquals(3, main.add(1, 2));
    }
}