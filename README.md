This repository contains a collection of labs from the Introduction to Artificial Intelligence module, completed during the third year of the Computer Science program at TU Dublin.

# Lab Summaries

### Lab 1: Introduction to Prolog
In this lab, I worked with Prolog using SWI-Prolog to learn how to define facts and rules to create a knowledge base. The main focus was on representing simple relationships between humans and animals.

- I defined entities like `man`, `dog`, and `mortal` and wrote queries to extract information from the Prolog database.
- I worked on exercises from *Learn Prolog Now* (LPN) Chapter 1, which involved writing and testing basic Prolog clauses.
- I experimented with provided Prolog code files (like `kb1.pl`, `kb2.pl`), which allowed me to practice the core principles of Prolog.
- I completed exercises 1.4 and 1.5 from Chapter 1 to deepen my understanding of how Prolog clauses and unification work.

### Lab 2: Python and NumPy Exercises
Lab 2 focused on using Python's NumPy library for numerical computations, which is essential for machine learning applications.

- I explored matrix and vector operations, including element-wise and matrix multiplication.
- I worked through tutorial tasks and exercises related to arrays and vectors, specifically using Jupyter Notebooks to test NumPy functionalities.
- I paid special attention to understanding the difference between vectors and column vectors, a fundamental concept for machine learning.
- I read through the SciPy tutorial to clarify concepts, particularly how matrices and vectors interact in NumPy.

### Lab 3: Monkey & Banana Problem in Prolog
In this lab, I solved the Monkey & Banana problem, which involves using state-space search to find a sequence of actions for the monkey to get the banana.

- I applied Prolog’s backtracking mechanism to model the environment and the actions of the agent.
- I created two versions of the `canget/1` predicate: one to find a solution without tracking the actions and another to return the sequence of actions.
- I explored recursion in Prolog by working through examples in LPN Chapter 3, such as `is_digesting(X,Y)` and `descend(X,Y)`.
- I completed exercises 3.2, 3.3, and 3.4 from Chapter 3 to practice recursion and apply it to more complex queries.

### Lab 4: Rule-Based Expert System - Media Advisor
Lab 4 focused on creating a rule-based expert system in Prolog, specifically a media advisor that recommends the best training medium based on environmental and job-related criteria.

- I defined Prolog rules to evaluate the appropriateness of various training media, such as verbal, visual, or hands-on methods.
- I implemented dynamic facts and predicates to handle real-time user input, allowing the system to provide personalized advice.
- I extended the system by adding custom rules to improve its recommendations and tested the system's ability to handle different inputs and environments.
- The system successfully advised on the best training medium for different job types and environmental conditions.

### Lab 5: Semantic Network in Prolog
In Lab 5, I worked with semantic networks to model relationships between animals in Prolog.

- I created a network where animals were connected by relationships like "is-a", "has", and "lives_in".
- I wrote queries to infer properties and relationships, such as identifying which animals belong to specific categories (e.g., mammals) and determining their habitats.
- I explored inheritance in the network, which allowed me to infer additional properties and relationships based on higher-level categories (e.g., a "dog" inherits properties from "mammal").
- The semantic network allowed for more complex reasoning about entities by leveraging Prolog’s unification mechanism.

### Lab 6: Perceptron for Logical Gates
This lab involved implementing a simple perceptron to simulate the behavior of logical gates like AND and OR.

- I created a `Perceptron` class in Python with methods for `feedforward` and `train`. The perceptron was initialized with random weights, and training involved adjusting the weights based on the error between predicted and actual outputs.
- I trained the perceptron on binary inputs for logical gates (AND, OR) and used the perceptron learning rule to minimize error.
- I experimented with more complex logical gates like XOR, which the simple perceptron could not learn due to the non-linearity of the XOR function.
- To overcome the limitations, I also implemented a `SigmoidPerceptron` to model AND and OR gates using a sigmoid activation function, providing a smoother output.

### Lab 7: Translating Numbers Between Languages Using Prolog
In Lab 7, I created a Prolog program to translate number words between German and English.

- I defined translation facts to map German number words to their English equivalents.
- I implemented a recursive predicate `listtran/2` to translate individual numbers and lists of numbers between the two languages.
- I tested the program with various queries to ensure it handled both individual number words and lists accurately.
- The system was designed to handle empty lists and larger number values, which allowed me to explore how recursion can be applied to translation tasks.

### Lab 8: Neural Network with 1 Hidden Layer
In this lab, I built a neural network with one hidden layer to solve a classification problem.

- I implemented a simple neural network using a 5x4 weight matrix and trained it with a dataset of 16 input samples and 5 corresponding output values.
- I defined a `sigm` function for the sigmoid activation function and used it to compute the output from the weighted sum of inputs.
- I implemented the `feedforward` method to process inputs through the network and calculate the output, followed by a cost function to compute the Mean Squared Error (MSE) between predicted and actual outputs.
- The network was trained using backpropagation, with weight adjustments based on the computed error. The goal was to minimize the MSE during training and improve prediction accuracy.
