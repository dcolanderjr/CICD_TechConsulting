package com.example;

/**
 * This is a class that provides greeting functionality.
 */
public class Greeter {

  /**
   * This is a constructor.
   */
  public Greeter() {

  }

  /**
   * Greets the specified person.
   * 
   * @param someone The name of the person to greet.
   * @return A greeting message.
   */
  public String greet(String someone) {
    return String.format("Hello, %s!", someone);
  }
}
