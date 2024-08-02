% Facts about symptoms for different diseases
symptom(flu, fever).
symptom(flu, headache).
symptom(flu, body_ache).
symptom(flu, sore_throat).

symptom(cold, cough).
symptom(cold, sneezing).
symptom(cold, sore_throat).
symptom(cold, runny_nose).

symptom(covid19, fever).
symptom(covid19, cough).
symptom(covid19, loss_of_taste).
symptom(covid19, loss_of_smell).
symptom(covid19, shortness_of_breath).

symptom(allergy, sneezing).
symptom(allergy, itchy_eyes).
symptom(allergy, runny_nose).

% Rules to diagnose disease based on symptoms
diagnose(Disease) :- 
    write('Enter the symptoms you are experiencing (end with a period): '), nl,
    read_symptoms(Symptoms),
    possible_disease(Disease, Symptoms).

% Read symptoms from the user
read_symptoms(Symptoms) :-
    read_symptoms([], Symptoms).

read_symptoms(Acc, Symptoms) :-
    write('> '),
    read(Symptom),
    ( Symptom == end_of_file
    -> Symptoms = Acc
    ;  read_symptoms([Symptom|Acc], Symptoms)
    ).

% Check if all symptoms match for a disease
possible_disease(Disease, Symptoms) :-
    disease_symptoms(Disease, Symptoms, []).

disease_symptoms(_, [], _).
disease_symptoms(Disease, [Symptom|Rest], Checked) :-
    symptom(Disease, Symptom),
    \+ member(Symptom, Checked),
    disease_symptoms(Disease, Rest, [Symptom|Checked]).
