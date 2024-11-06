% Media Advisor: A Complete Demonstration of Rule-Based Expert Systems

% Michael Negnevitsky. 2004. Artificial Intelligence: A Guide to Intelligent Systems.

% This Prolog code defines an expert system, the "Media Advisor," which provides 
% advice on the most suitable medium for delivering training programs. Based on 
% user inputs about the trainee's work environment, job type, and feedback requirement, 
% the system uses a set of rules to determine the training situation and response type, 
% ultimately recommending an appropriate training medium.

% The expert system relies on:
% - Stimulus situations (e.g., verbal, visual, physical object, symbolic) 
%   defined by the work environment.
% - Stimulus responses (e.g., oral, hands-on, documented, analytical) 
%   based on job roles.
% - Medium recommendations (e.g., workshop, lecture-tutorial, videocassette, 
%   role-play exercises) based on both the stimulus situation and response type.

% --- Dynamic Declarations ---
:- dynamic environment/1, job/1, feedback/1.

% --- Rules for Stimulus Situations ---
% Rule 1: Define verbal stimulus situations based on specific environments
stimulus_situation(verbal) :- 
    environment(papers);
    environment(manuals);
    environment(documents);
    environment(textbooks).

% Rule 2: Define visual stimulus situations based on specific environments
stimulus_situation(visual) :- 
    environment(pictures);
    environment(illustrations);
    environment(photographs);
    environment(diagrams).

% Rule 3: Define physical object stimulus situations based on specific environments
stimulus_situation(physical_object) :- 
    environment(machines);
    environment(buildings);
    environment(tools).

% Rule 4: Define symbolic stimulus situations based on specific environments
stimulus_situation(symbolic) :- 
    environment(numbers);
    environment(formulas);
    environment(computer_programs).

% --- Rules for Stimulus Responses (Job Types) ---
% Rule 5: Define oral stimulus responses based on specific job types
stimulus_response(oral) :- 
    job(lecturing);
    job(advising);
    job(counselling).

% Rule 6: Define hands-on stimulus responses based on specific job types
stimulus_response(hands_on) :- 
    job(building);
    job(repairing);
    job(troubleshooting).

% Rule 7: Define documented stimulus responses based on specific job types
stimulus_response(documented) :- 
    job(writing);
    job(typing);
    job(drawing).

% Rule 8: Define analytical stimulus responses based on specific job types
stimulus_response(analytical) :- 
    job(evaluating);
    job(reasoning);
    job(investigating).

% --- Rules for Medium Suggestions ---
% Rule 9: Medium suggestions based on physical object situations and hands-on responses
medium(workshop) :- 
    stimulus_situation(physical_object), 
    stimulus_response(hands_on), 
    feedback(yes).

% Rule 10: Medium suggestion for lecture tutorials based on symbolic situations and analytical responses
medium(lecture_tutorial) :- 
    stimulus_situation(symbolic), 
    stimulus_response(analytical), 
    feedback(yes).

% Rule 11: Medium suggestion for videocassette based on visual situations and documented responses without feedback
medium(videocassette) :- 
    stimulus_situation(visual), 
    stimulus_response(documented), 
    feedback(no).

% Rule 12: Medium suggestion for lecture tutorials based on visual situations and oral responses
medium(lecture_tutorial) :- 
    stimulus_situation(visual), 
    stimulus_response(oral), 
    feedback(yes).

% Rule 13: Medium suggestion for role-play exercises based on verbal situations and oral responses
medium(role_play_exercises) :- 
    stimulus_situation(verbal), 
    stimulus_response(oral), 
    feedback(yes).

% Rule 14: Medium suggestion for lecture tutorials based on verbal situations and analytical responses
medium(lecture_tutorial) :- 
    stimulus_situation(verbal), 
    stimulus_response(analytical), 
    feedback(yes).

% Rule 15: Medium suggestion for seminar based on verbal situations and oral responses without feedback
medium(seminar) :- 
    stimulus_situation(verbal), 
    stimulus_response(oral), 
    feedback(no).

% Rule 16: Medium suggestion for instruction manuals based on physical object situations and documented responses without feedback
medium(instruction_manuals) :- 
    stimulus_situation(physical_object), 
    stimulus_response(documented), 
    feedback(no).

% --- Main Procedure to Interact with the User and Provide Advice ---
go :- 
    cleanInputs,           % Ensure a clean slate for each interaction
    getEnvironment,        % Retrieve environment input from the user
    getJob,                % Retrieve job input from the user          
    getFeedback,           % Retrieve feedback input from the user
    ( stimulus_situation(SS),  
      nl, write('Stimulus situation is: '), write(SS), nl,
      ( findall(M, medium(M), Mediums),  % Get all applicable mediums
        ( Mediums \= [] ->  
            write('Recommended medium(s): '), writeln(Mediums)  
        ; 
            writeln('Could not advise on an appropriate medium. Please check your inputs.')  
        )
      )
    ; 
      writeln('Could not determine stimulus situation. Please check your inputs.')  
    ),
    cleanInputs.           % Clear input after completion

% --- User Input Handlers ---
% Get environment input and validate
getEnvironment :- 
    write('Input the environment (e.g. papers, manuals, documents, textbooks): '), 
    read(E), 
    ( valid_environment(E) -> 
        assertz(environment(E)); 
        writeln('Invalid environment. Please try again.'), fail
    ).  

% Get job input and validate
getJob :-  
    write('Input the job (e.g. lecturing, advising, counselling, building): '),
    read(J),
    ( valid_job(J) -> 
        assertz(job(J));  
        writeln('Invalid job. Please try again.'), fail
    ).  

% Get feedback input and validate
getFeedback :-  
    write('Is feedback required (yes/no)? '),
    read(F),
    ( valid_feedback(F) -> 
        assertz(feedback(F));  
        writeln('Invalid feedback. Please enter yes or no.'), fail
    ).  

% Clean up the dynamic facts after interaction
cleanInputs :- 
    retractall(environment(_)),  
    retractall(job(_)),           
    retractall(feedback(_)).      

% --- Validations ---
% Define valid environments
valid_environment(papers).
valid_environment(manuals).
valid_environment(documents).
valid_environment(textbooks).
valid_environment(pictures).
valid_environment(illustrations).
valid_environment(photographs).
valid_environment(diagrams).
valid_environment(machines).
valid_environment(buildings).
valid_environment(tools).
valid_environment(numbers).
valid_environment(formulas).
valid_environment(computer_programs).

% Define valid jobs
valid_job(lecturing).
valid_job(advising).
valid_job(counselling).
valid_job(building).
valid_job(repairing).
valid_job(troubleshooting).
valid_job(writing).
valid_job(typing).
valid_job(drawing).
valid_job(evaluating).
valid_job(reasoning).
valid_job(investigating).

% Define valid feedback responses
valid_feedback(yes).
valid_feedback(no).

% --- Instructions to Run the Program ---
% To run the program:
% 1. Open your Prolog interpreter (e.g., SWI-Prolog).
% 2. Load the program by selecting "File" -> "Consult" and choosing the Prolog file (e.g., 'media_advisor.pl').
% 3. Start the user interaction by typing:
%    ?- go.
% 4. Follow the prompts to input the environment, job type, and feedback requirement.
% 5. Verify that the system outputs the correct stimulus situation and the recommended medium based on the rules defined.

% --- Example Test Cases ---
% Test Case 1:
% Input:
%   - Environment: machines
%   - Job: repairing
%   - Feedback: yes
% Expected Output:
%   - Stimulus Situation: physical_object
%   - Recommended Medium: [workshop]

% Test Case 2:
% Input:
%   - Environment: pictures
%   - Job: typing
%   - Feedback: no
% Expected Output:
%   - Stimulus Situation: visual
%   - Recommended Medium: [videocassette]

% Test Case 3:
% Input:
%   - Environment: textbooks
%   - Job: lecturing
%   - Feedback: yes
% Expected Output:
%   - Stimulus Situation: verbal
%   - Recommended Medium: [role_play_exercises]

% Test Case 4:
% Input:
%   - Environment: formulas
%   - Job: reasoning
%   - Feedback: yes
% Expected Output:
%   - Stimulus Situation: symbolic
%   - Recommended Medium: [lecture_tutorial]

% Test Case 5:
% Input:
%   - Environment: machines
%   - Job: writing
%   - Feedback: no
% Expected Output:
%   - Stimulus Situation: physical_object
%   - Recommended Medium: [instruction_manuals]