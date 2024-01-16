FasdUAS 1.101.10   ��   ��    k             l     ��  ��    @ : Summary: open all selected URLs in a new window in Safari     � 	 	 t   S u m m a r y :   o p e n   a l l   s e l e c t e d   U R L s   i n   a   n e w   w i n d o w   i n   S a f a r i   
  
 l     ��������  ��  ��        l     ��  ��    $  Copyright 2024 Michael Hucka.     �   <   C o p y r i g h t   2 0 2 4   M i c h a e l   H u c k a .      l     ��  ��    H B License: MIT License � see file "LICENSE" in the project website.     �   �   L i c e n s e :   M I T   L i c e n s e      s e e   f i l e   " L I C E N S E "   i n   t h e   p r o j e c t   w e b s i t e .      l     ��  ��    @ : Website: https://github.com/mhucka/Keyboard-maestro-hacks     �   t   W e b s i t e :   h t t p s : / / g i t h u b . c o m / m h u c k a / K e y b o a r d - m a e s t r o - h a c k s      l     ��������  ��  ��        l         !  x     �� " #��   " 1      ��
�� 
ascr # �� $��
�� 
minv $ m       % % � & &  2 . 4��        Yosemite (10.10) or later    ! � ' ' 4   Y o s e m i t e   ( 1 0 . 1 0 )   o r   l a t e r   ( ) ( x    �� *����   * 2  	 ��
�� 
osax��   )  + , + l     ��������  ��  ��   ,  - . - l     �� / 0��   / L F Helper functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    0 � 1 1 �   H e l p e r   f u n c t i o n s   ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ .  2 3 2 l     ��������  ��  ��   3  4 5 4 i     6 7 6 I      �� 8���� 0 openinsafari openInSafari 8  9�� 9 o      ���� 0 urls  ��  ��   7 O     _ : ; : k    ^ < <  = > = I   	������
�� .miscactvnull��� ��� null��  ��   >  ? @ ? r   
 " A B A J   
  C C  D E D n   
  F G F 4    �� H
�� 
cobj H m    ����  G o   
 ���� 0 urls   E  I�� I n     J K J 1    ��
�� 
rest K o    ���� 0 urls  ��   B J       L L  M N M o      ���� 0 	first_url   N  O�� O o      ���� 0 remaining_urls  ��   @  P Q P I  # /���� R
�� .corecrel****      � null��   R �� S T
�� 
kocl S m   % &��
�� 
docu T �� U��
�� 
prdt U K   ' + V V �� W��
�� 
pURL W o   ( )���� 0 	first_url  ��  ��   Q  X�� X O   0 ^ Y Z Y X   7 ] [�� \ [ I  G X���� ]
�� .corecrel****      � null��   ] �� ^ _
�� 
kocl ^ m   I J��
�� 
bTab _ �� ` a
�� 
insh ` n   K O b c b  ;   N O c 2  K N��
�� 
bTab a �� d��
�� 
prdt d K   P T e e �� f��
�� 
pURL f 1   Q R��
�� 
pURL��  ��  
�� 
pURL \ o   : ;���� 0 remaining_urls   Z 4   0 4�� g
�� 
cwin g m   2 3���� ��   ; m      h h�                                                                                  sfri  alis    p  Preboot                    �!7�BD ����
Safari.app                                                     �����`�        ����  
 cu             Applications  F/:System:Volumes:Preboot:Cryptexes:App:System:Applications:Safari.app/   
 S a f a r i . a p p    P r e b o o t  -/Cryptexes/App/System/Applications/Safari.app   /System/Volumes/Preboot ��   5  i j i l     ��������  ��  ��   j  k l k l     �� m n��   m L F Main body ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    n � o o �   M a i n   b o d y   ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ l  p q p l     ��������  ��  ��   q  r s r l    * t���� t O     * u v u k    ) w w  x y x r     z { z 6    | } | n    
 ~  ~ 1    
��
�� 
pnam  4   �� �
�� 
pcap � m    ����  } =    � � � 1    ��
�� 
pisf � m    ��
�� boovtrue { o      ���� 0 	front_app   y  � � � I   �� ���
�� .sysodelanull��� ��� nmbr � m     � � ?�      ��   �  � � � I   #�� � �
�� .prcskcodnull���     **** � m    ����  � �� ���
�� 
faal � m    ��
�� eMdsKcmd��   �  ��� � I  $ )�� ���
�� .sysodelanull��� ��� nmbr � m   $ % � � ?�      ��  ��   v m      � ��                                                                                  sevs  alis    N  focus                      �BD ����System Events.app                                              �����        ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    f o c u s  -System/Library/CoreServices/System Events.app   / ��  ��  ��   s  � � � l     ��������  ��  ��   �  � � � l  + � ����� � O   + � � � � k   / � � �  � � � l  / /�� � ���   � B < The lack of a universal way to tell any application to copy    � � � � x   T h e   l a c k   o f   a   u n i v e r s a l   w a y   t o   t e l l   a n y   a p p l i c a t i o n   t o   c o p y �  � � � l  / /�� � ���   � D > selected text to the clipboard means we have to use sucky GUI    � � � � |   s e l e c t e d   t e x t   t o   t h e   c l i p b o a r d   m e a n s   w e   h a v e   t o   u s e   s u c k y   G U I �  � � � l  / /�� � ���   �   scripting.    � � � �    s c r i p t i n g . �  � � � r   / < � � � n   / 8 � � � 2  6 8��
�� 
cpar � l  / 6 ����� � I  / 6���� �
�� .JonsgClp****    ��� null��   � �� ���
�� 
rtyp � m   1 2��
�� 
ctxt��  ��  ��   � o      ���� 0 
candidates   �  � � � Y   = g ��� � ��� � r   M b � � � n  M Y � � � m   W Y��
�� 
ctxt � l  M W ����� � n   M W � � � m   U W��
�� 
ctxt � n  M U � � � 4   P U�� �
�� 
cobj � o   S T���� 0 i   � o   M P���� 0 
candidates  ��  ��   � n      � � � 4   \ a�� �
�� 
cobj � o   _ `���� 0 i   � o   Y \���� 0 
candidates  �� 0 i   � m   @ A����  � I  A H�� ���
�� .corecnte****       **** � o   A D���� 0 
candidates  ��  ��   �  � � � Z   h  � ����� � =   h n � � � o   h k���� 0 
candidates   � J   k m����   � k   q { � �  � � � I  q x� ��~
� .sysodisAaleR        TEXT � m   q t � � � � � " N o   t e x t   s e l e c t e d .�~   �  ��} � L   y {�|�|  �}  ��  ��   �  � � � r   � � � � � J   � ��{�{   � o      �z�z 0 urls   �  � � � X   � � ��y � � Z   � � � ��x�w � l  � � ��v�u � G   � � � � � C   � � � � � o   � ��t�t 	0 _item   � m   � � � � � � � 
 h t t p : � C   � � � � � o   � ��s�s 	0 _item   � m   � � � � � � �  h t t p s :�v  �u   � r   � � � � � o   � ��r�r 	0 _item   � n       � � �  ;   � � � o   � ��q�q 0 urls  �x  �w  �y 	0 _item   � o   � ��p�p 0 
candidates   �  � � � Z   � � � ��o�n � =   � � � � � o   � ��m�m 0 urls   � J   � ��l�l   � k   � � � �  � � � I  � ��k ��j
�k .sysodisAaleR        TEXT � m   � � � � � � � 6 N o   U R L s   f o u n d � i n   s e l e c t i o n .�j   �  ��i � L   � ��h�h  �i  �o  �n   �  ��g � n  � � � � � I   � ��f ��e�f 0 openinsafari openInSafari �  ��d � o   � ��c�c 0 urls  �d  �e   �  f   � ��g   � m   + , � ��                                                                                  sevs  alis    N  focus                      �BD ����System Events.app                                              �����        ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    f o c u s  -System/Library/CoreServices/System Events.app   / ��  ��  ��   �  ��b � l     �a�`�_�a  �`  �_  �b       �^ � � � �^   � �]�\�[
�] 
pimr�\ 0 openinsafari openInSafari
�[ .aevtoappnull  �   � **** � �Z�Z    �Y %�X
�Y 
vers�X   �W�V
�W 
cobj    �U
�U 
osax�V   � �T 7�S�R�Q�T 0 openinsafari openInSafari�S �P�P   �O�O 0 urls  �R   �N�M�L�K�N 0 urls  �M 0 	first_url  �L 0 remaining_urls  
�K 
pURL  h�J�I�H�G�F�E�D�C�B�A�@�?�>�=
�J .miscactvnull��� ��� null
�I 
cobj
�H 
rest
�G 
kocl
�F 
docu
�E 
prdt
�D 
pURL�C 
�B .corecrel****      � null
�A 
cwin
�@ .corecnte****       ****
�? 
bTab
�> 
insh�= �Q `� \*j O��k/��,lvE[�k/E�Z[�l/E�ZO*����l� 	O*�k/ ( %�[��l kh *���*�-6��l� 	[OY��UU  �<	�;�:
�9
�< .aevtoappnull  �   � ****	 k     �  r  ��8�8  �;  �:  
 �7�6�7 0 i  �6 	0 _item    ��5�4�3�2 ��1�0�/�.�-�,�+�*�)�(�'�& ��%�$�# � ��" ��!
�5 
pcap
�4 
pnam  
�3 
pisf�2 0 	front_app  
�1 .sysodelanull��� ��� nmbr�0 
�/ 
faal
�. eMdsKcmd
�- .prcskcodnull���     ****
�, 
rtyp
�+ 
ctxt
�* .JonsgClp****    ��� null
�) 
cpar�( 0 
candidates  
�' .corecnte****       ****
�& 
cobj
�% .sysodisAaleR        TEXT�$ 0 urls  
�# 
kocl
�" 
bool�! 0 openinsafari openInSafari�9 �� '*�k/�,�[�,\Ze81E�O�j O���l O�j UO� �*��l �-E` O )k_ j kh  _ a �/�-�-_ a �/F[OY��O_ jv  a j OhY hOjvE` O 8_ [a a l kh �a 
 �a a & �_ 6FY h[OY��O_ jv  a j OhY hO)_ k+ U ascr  ��ޭ