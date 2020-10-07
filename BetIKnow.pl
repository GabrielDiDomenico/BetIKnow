/*
Autor: Gabriel Di Domenico
Data: 01/06/2020

Trabalho consiste e mcriar um programa para adivinhar qual é o pensamento do usuário.
Neste programa o código irá tentar adivinhar qual é o personagem do anime evangelion o usuário esta pensando.

  Comece digitando ?- go.  


*/

go :- nl,
      write('Think about one character from the anime Neon Genesis Evangelion and I will try to guess what is.'),
      nl,
      write('Please answer yes or no to the following questions:'),
      nl, nl,
      guess(Character),
      write('The character is '),
      write(Character),
      nl,
      undo.

/* hypotheses to be tested */
guess(rei_ayanami)   :- rei_ayanami, !.
guess(asuka_langley_soryu) :- asuka_langley_soryu, !.
guess(shinji_ikari)   :- shinji_ikari, !.
guess(toji_suzuhara)   :- toji_suzuhara, !.
guess(kaworu_nagisa)   :- kaworu_nagisa, !.
guess(mari_illustrious_makinami)   :- mari_illustrious_makinami, !.
guess(gendo_ikari)   :- gendo_ikari, !.
guess(kozo_fuyutsuki)   :- kozo_fuyutsuki, !.
guess(misato_katsuragi)   :- misato_katsuragi, !.
guess(ritsuko_akagi)   :- ritsuko_akagi, !.
guess(naoko_akagi)   :- naoko_akagi, !.
guess(ryoji_kaji)   :- ryoji_kaji, !.
guess(makoto_hyuga)   :- makoto_hyuga, !.
guess(maya_ibuki)   :- maya_ibuki, !.
guess(shigeru_aoba)   :- shigeru_aoba, !.
guess(yui_ikari)   :- yui_ikari, !.
guess(kyoko_zeppelin_sohryu)   :- kyoko_zeppelin_sohryu, !.
guess(keel_lorenz)   :- keel_lorenz, !.
guess(kensuke_aida)   :- kensuke_aida, !.
guess(hikari_horaki)   :- hikari_horaki, !.
guess(adam)   :- adam, !.
guess(lilith) :- lilith, !.
guess(pen_pen)   :- pen_pen, !.
guess(unknown).             /* no diagnosis */

/* animal identification rules */
pen_pen :- verify(is_a_penguin).

rei_ayanami :- eva_pilot, 
           woman,
           verify(is_an_vessel).

asuka_langley_soryu :- eva_pilot,
                       woman,
                       verify(have_red_air).

shinji_ikari :- eva_pilot,
             verify(is_the_main_character).

toji_suzuhara :- eva_pilot.

kaworu_nagisa :- eva_pilot,
                angel,
                man.

mari_illustrious_makinami :- eva_pilot,
                            woman,
                            verify(wear_glasses).

gendo_ikari :- man,
              nerv,
              verify(is_the_commander).

kozo_fuyutsuki :- man,
                  nerv,
                  verify(is_the_deputy_commander).

misato_katsuragi :- woman,
                  nerv,
                  verify(is_the_major_or_captain).

ritsuko_akagi :- woman,
                nerv,
                verify(is_the_head_scientist).

naoko_akagi :- woman,
              nerv,
              verify(was_the_chief_scientist),
              verify(made_the_Magi_supercomputer).

ryoji_kaji :- man,
            nerv,
            verify(is_the_special_inspector),
            verify(have_watermelons).

makoto_hyuga :- man,
              nerv,
              verify(is_the_first_liutenant),
              verify(reads_manga_in_his_spare_time).

maya_ibuki :- woman,
            nerv,
            verify(is_the_first_liutenant).

shigeru_aoba :- man,
              nerv,
              verify(is_the_first_liutenant),
              verify(is_an_avid_guitar_player).

yui_ikari :- woman,
            gehirn,
            verify(is_gendo_wife).

kyoko_zeppelin_sohryu :- woman,
                      gehirn,
                      verify(is_asuka_mother).
            
keel_lorenz :- man,
            seele,
            verify(is_the_leader).

kensuke_aida :- verify(is_a_kid),
                man,
                verify(everytime_hold_his_camcorder).

hikari_horaki :- verify(is_a_kid),
                woman,
                verify(is_an_class_representative),
                verify(cook_very_well).

adam :- angel,
        verify(first_human_on_earth),
        verify(progenitor_of_all_angels).

lilith :- angel,
        verify(progenitor_of_the_humanty).


/* classification rules */
human :- verify(is_a_human), !.

woman :- verify(is_a_woman), !.

nerv :- verify(work_on_nerv), !.

seele :- verify(is_a_member_of_the_secret_group_seele), !.

gehirn :- verify(work_on_gehirn), !.

man :- verify(is_a_man), !.

angel :- verify(is_a_angel), !.

eva_pilot :- verify(is_a_kid),
             verify(pilot_an_eva_unit), !.

/* how to ask questions */
ask(Question) :-
    write('Does the character '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
      assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.



