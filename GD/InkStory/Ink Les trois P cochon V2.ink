//INCLUDE vnsup_api.ink
VAR pièceActuelle = "Maison"
VAR Matériaux = "Aucun"
VAR Barique = false
VAR Halcoole = false
VAR Lampe = false
VAR CryptoMoney = false //OK
VAR SpameCuisine = 0 //OK
VAR Cle = false 
VAR Cafeine = false //OK
VAR Bunker = false //OK
VAR Imbécile = false //OK
VAR SpamePC = 0
VAR IdeTrappe = false
VAR TireBouchon = false
VAR TrapOuvert = false
VAR RubyMathéo = 0
VAR PicoRuby = 0
VAR MathéoPico = 0
VAR DeceptionPierre = 0
// 
/*
Information et source :
Le groupe joué est composé de trois frères (trois petit cochon):
- Pico Chon (l'aîné, alcoolique invétérer, est un bon vivant qui est apprécier pour sa bonne humeur, mais pas pour ses choix de vie, se qui mets parfois ses interlocuteur dans l'embaras, possède une grande sagesse)
- Ruby Chon (le benjamin, Nerd fanne de crypto money, plutot malin et au courant de tout les news, il est seppendant asser maladroit et manque clairement de savoir vivre)
- Mathéo Chon (le cadet, un appolon sculpté comme une stars holywoodiene, bête comme ses pied, tentera de toujours de drager la gente féminine, il est fort et adroit, mais n'est pas très futé)

Liste des PNJ :
- PNJ 1 = Pierre ??? (Loup déguiser en cochon, employer du "Au Champ" boutique alimentaire, plutôt du genre mauvais blagueur, et à l'air blazer constament)
- PNJ 2 = Philipe Elshebacon (Chef cuistot du " ??? " un restaurant, tres profesionel, il en est tres sérieux, il est du genre impatient, impulsif, et ne suporte pas les échec)
- PNJ 3 = Paméla Redon (employer du "Le Groin Merlin" quincaillerie, calme, aimable et posé, elle sait se faire apprécier des client, et tentera si elle le peux de faire acheter à ses consomateur toujours plus que se dont ils ont besoin, quite à s'appuyer sur leur crédulité...)
- PNJ 4 = ??? ??? (L'Antiquaire, frère du clochard, perssonage mistérieux, tres distinguer, est du genre à garder ses secret et problème pour lui, tres émotif il s'inquiette énormémant pour son frère, curieux, il se proposera d'acheter le moindre bibelot, si selui ci présent une certaine valeur)
- PNJ 5 = ??? ??? (Le clochard, frère de l'antiquaire, ayant eu un parcours chaotique, il est plutôt du genre distant au premier abord, il reste tout de même bon vivant, constament saoule, ses discution son presque incompréenssible, il manque seulement de compagnie et de compation)
- PNJ 6 = ??? ??? (La mêre des trois petit cochon, douce, mais avec un fort caractère, elle sait se fair respecter de ses rejetons, est apprécier de tous)

Résumer du visual novel :
Dans un univers ou le peuple des loups, et le peuple des cochons, vivent en parfaite hotarcie, les loup décide d'envoyer cher les cochon "Bacon Les Bain" une bombe nucléaire vaporisant un gaze qui transforme les cochon en charcuterie, si les loup on décider de cette attaque, c'est à cose de leur pénurie d'arbre à charcuterie qu'il on entièrement rasé par mégarde, faute d'expention de leur urbanisation.
Dans la ville de "Bacon Les Bain", les trois frère resoivent un appelle de leur père qui se trouvent dans le camps ennemie en temps qu'espion, il les prévient de leur intention nucléaire et leur demande de se mettre à l'abrit (fin de l'appelle), les cochon suivant ses instructions, se voie pour mission d'airmétiser la cave se trouvant sous leur maison avec n'importe quelle ressource qui pourrait faire l'affaire pour se protéger des gazes avec leur mêre.
Il déambuleron donc dans la ville et accomplirons divers action afin d'assurer leur survie.

Liste des contenue :
- Doit avoir au totale 15 matériaux différent au choix 
- Le jeu à 17 fin possible (1 pour chaque matériaux "5 mauvais, 5 neutre, 5, bonne", 1 mauvais avec le clochard, 1 mauvais avec la lampe magique)
- Chaque entrée dans une zone se doit de comporter 5 description du lieux, ceux ci sont proposer aléatoirement.
- Chaque texte d'analyse ou de discution dispose minimume de trois texte différent proposer aléatoirement.
- La répartition des matériaux dans chaque zone est équitablement dispatché, et plus ou moins dificile à obtenire.
- l'obtention de matériaux nécécite minimume 5 interaction et maximume 17.
- le jeu doit tenire au minimum 10 minute de lecture
- Ne comporte pas de narateur, mais peut décrire se que pense un perssonage lors d'une action.
- déveloper les texte pour que se soit interressant  lire "voire trouver des détaille permettant de mieux connaitre son evironement et les perssonage"
- suivre les directivent de situation des "texte" et trouver de quoi remplacer chaque ??? celon le besoin.
*/

//INTRODUCTION
/*    Seule instant ou il y aura un narateur pour lancer l'histoire...
    "La table est dressée, mais il manque la cuisinière. Une note griffonnée traîne sur le frigo : 'Réchauffez le gratin, pas vos disputes. - Maman ❤️'",
    "Le silence est uniquement troublé par le tic-tac obstiné d'une horloge en forme de jambon. Quelque part, une casserole bout pour rien.",
    "Une nappe rose bonbon recouvre la table. Trois verres, une bouteille entamée, et le gratin, carbonisé au bord.",
    "Les assiettes sont prêtes, mais aucune main maternelle ne vient les remplir. Juste la chaleur laissée par l’absence.",
    "L’odeur du plat flotte dans l’air comme un avertissement. La mère n’est pas là, mais son autorité plane dans chaque coin de la cuisine."
*/

pico: C'est du gratin ça ? (hausse les épaules)
pico: Bon… j’ouvre une bouteille ?
~ ActivatePuzzle(true)
pico: Elle a bien dit "je ne veux pas de vos disputes", elle a pas dit que je pouvais pas sortir l'apéro.
ruby: (Les yeux rivés sur son écran) J'ai hacké les flux météo de la zone 7, qui veux la météo des Pérault ?
matheo: Quelqu’un peut me passer le sel ?
pico: (Elle à pas froid au yeux la soeurette...)Tu t'est pas arenger à se que je voie !
pico: Toujours à tripoter tes clavier et à t'infiltrer partout, t'a pas peur des conséquences ?
matheo: ...
ruby: T'inquète... (Là, je risque plus une intoxication alimentaire qu'autre chose...)
matheo: Che gratin a un goût shi... 
matheo: Prononcer… (C’est quoi le secret ?)
pico: Le secret, c’est de laisser Ruby poser les sabots dans une cuisine...
matheo: Mais comment tu...
ruby: T'est comme un livre ouvert frangin.
ruby: (un livre avec seulement la couverture...)
ruby: Au faite, CryptoPorc est encore en chute…
ruby: On vit une crise, les gars.
matheo: Une crise ?
ruby: Je vous l'avais dit : fallait investir dans le Pigcoine.
matheo: Moi j’ai investi dans mon corps.
matheo: C’est du 100% naturel, sans hormones, regarde moi ces abdos !
pico: Pff... 
pico: T’as plus d’huile de coude que d'étincel dans les circuits.
matheo: Merci, je prend sa comme un compliment.
pico: Ha ha, et si non...
pico t'a toujours de vue sur ...
ruby: Attendez les gars… 
ruby: J'ai un appel crypté...
ruby: C'est papa !
pico & matheo: Tu décone !
//Le téléphone vibre. Ruby décroche. Une voix déformée, hachée par l’interférence, s’élève.*
pere: Ruby… C’est moi.
pere: Écoute très attentivement, c’est pas un exercice.
pere: Les Loups vont activer le PigBang 3000™ !
pico: Le quoi...?
pere: Une bombe, pas une simple ogive.
pere: Elle vaporise un gaz qui sature l’air, s'infiltrant dans les pores et l'eau.
pere: Il vous transforme… en charcuterie au contacte.
matheo: C’est... légal ça ?
pere: Vous devez vous isolé, la ca**** d**rais *tr* *o**tions.
ruby: Sa capte male, tu peux répéter ?
pere: N***porte quoi **** isoler l'***, ***chez t***, cave.
matheo: Arrète de parler la boche pleine le vieux !
pere: Auc**** fu*tes, ****** **** gaz, ** peu* *** d*re *lus...
pere: **** iminent !
//ommunication terminée.
pico: C’était lui… pas un rêve, pas une connerie…, c’était bien lui!
ruby: S’il dit vrai, on a moins d'une heures. (Et encore…)
matheo: Ok.
matheo: On panique ?
matheo: On fait quoi ?
matheo: On est foutue non ?
matheo: Je vais chercher Pamela !
pico: Non, tu restes ici.
pico: On doit établir une liste.
ruby: c'est déja fait
ruby: Trouver la cave, les bons matériaux, puis l'isoler.
matheo: Et maman ?
ruby: Et trouver maman!
pico: Pas le moment de flancher alors!
pico: On a grandi avec les contes de la guerre du Lard-Froid.
pico: Là… c’est pour de vrai!
pico: Aller les gars!
// Lancement_Jeu

-> ActionPrincipale

=== ActionPrincipale===
+ [Ce déplacer] Déplacement ...
-> ActionChangeScene
+ {pièceActuelle == "Maison"} [Interrieur]
-> Interrieur
+ {TrapOuvert == true}{pièceActuelle == "Maison"} [Cave]
-> Cave
+ {pièceActuelle == "Ruelle"} [Antiquaire]
-> Antiquaire
+ {pièceActuelle == "Ruelle"} [Clochard]
-> Clochard
+ {pièceActuelle == "Ruelle"} [Ruine]
-> Ruine
+ {pièceActuelle == "Place du village"} [Puit]
-> Puit
+ {pièceActuelle == "Place du village"} [Mairie]
-> Mairie
+ {pièceActuelle == "Allée commerçantes"} [Au Champ]
-> AuChamp
+ {pièceActuelle == "Allée commerçantes"} {Imbécile != true} [Restaurent]
-> Restaurent
+ {pièceActuelle == "Allée commerçantes"} [Groin Merlin]
-> GroinMerlin

=== ActionChangeScene===

+ {pièceActuelle != "Maison"} [Maison] {~1|2|3}
//~ changeBg ("Maison")
//~ show 
~ pièceActuelle = "Maison"
-> ActionPrincipale
+ {pièceActuelle != "Ruelle"} [Ruelle] {~1|2|3}
//~ changeBg ("Ruelle")
//~ show ("Clodo")
~ pièceActuelle = "Ruelle"
-> ActionPrincipale
+ {pièceActuelle != "Place du village"} [Place du village] {~1|2|3}
//~ changeBg ("Pvillage")
~ pièceActuelle = "Place du village"
-> ActionPrincipale
+ {pièceActuelle != "Allée commerçantes"} [Allée commerçantes] {~1|2|3}
//~ changeBg ("AlléeC")
~ pièceActuelle = "Allée commerçantes"
-> ActionPrincipale

// Maison //
== Interrieur ==
{~(La maison semble paisible "malgré la menace imminente", un air de nostalgie embomait le groupe à chaque recoin.)|(Les bruits de pas résonnaient dans les escaliers, ravivant les souvenirs d’enfance dans l’air.)|(Les rideaux sont tirés, maman avais cette facheuse abitude de se sentire observer...)|(Une odeur de cire, d’alcool et de vieux coussins imprègne la pièce, on crorait presque n'avoir j'amais quiter les lieux)|(Ruby a laisse encore traîner ses circuits imprimés sur la table basse, Mathéo les regarde "les ayent confondue avec des biscuits."}
+ [Fouiller le raie de chaussé] 
Les trois frères se décide d'inspecter le raie de chaussé, chacun suivant leur intuition.
++ [Pico Chon] 
    {IdeTrappe == false:
    pico:(Bon... si je me souviens bien.)
    pico:(Je décale se fauteuil...)
    pico:(M'accroupit, et donne un coup de sabot d’un mouvement expert dans cette carpette poussiéreuse, et...)
    pico:Ha ha!
    pico:Elle croiait que j’avais oublié la cave à vin ?
    pico:C’est MON coin, c’est sacré!)
    ~IdeTrappe = true
    }
pico:{~(Toujours là, <>|C'te vieille trappe..., <>|Y’a du vin qui pleure là-dedans, <>}
<>{~toujours fermée, évidemment.|et moi aussi…)}

    {Cle == false:
    ruby:Pas de clé ? ¬‿¬
    pico:Elle l’a planquée... encore.
    pico:Genre "faut pas abuser" (tu parles).
    matheo:Elle sait même pas ce qui arrive... c’est ça le pire.
    pico:Ouais... (et je vais crever sobres, super plan!).
    }
    
    {Cle == true:
    pico:Ruby, passe moi la clé, j'attend se moment de puis trop longtemps.
    ruby:Ok, mais fais gaffe quand tu dessandra, et ne va pas...
    pico:Oui oui, c'est bon...
    pico:On croirait entendre Ma..
    matheo:Martin?
    matheo:Martine Souche, notre ancien prof de CP?
    pico:Que...
    ruby:(il le fais exprès, c'est de l'art à se niveau... ಥ_ಥ )
    pico:Ouai, c'est sa..., bon.
    pico:Sésame ouvre toi!
    pico:(C'est presque émouvent)
    ~TrapOuvert = true
    ~Cle = false
    }

{~TireBouchon == false}pico:(Voyons si au moins elle m’a laissé mon ouvre-bouteille...)
pico:{~(Dans se tiroir?)|(Cette vieille boîte...)|(Sous se pot...)}
pico:{Vide...|(Des bouchons), rien d'autre...|(Poussière et miettes de Bretzel)...}

    {TireBouchon == false:
    pico:Rien.
    pico:Nada.
    pico:Même ça, elle l’a embarqué!
    pico:Toutes mes planque sont vide.
    matheo:Tu crois qu’elle s’est fait un apéro solo de fin du monde ?
    ruby:Non, elle voulait juste pas que Pico picoles tout en douce... comme d’hab. ¬‿¬
    pico:Elle fait ça par amour, j’suis sûr.
    pico:Un amour sec et sans raisin...
    ~TireBouchon = true
    }
    {TireBouchon == true:
    ruby:{~C'est bon là, tu ne le trouvera pas... ¬_¬|(C'est plus une adiction à se train là... o_o)|Tant qu’t’y es, retrouve-moi le vrai processeur 64 bits de ma Guépard…! ¬‿¬}
    matheo:{~Je ne suis pas sur que regarder dans les même cachettes change quoi que ce soit... |C'est bon tu la trouver?|(Sa me rappelle la foi ou il avait perdue la gourde de cogniaque de papa...)}
    }
pico:{Je les ouvres comment maintenant, avec les dents?|Je perd mon temps...|(Je devrais arrèter de chercher maintenant...)}
-> Interrieur

++ [Ruby Chon] 

ruby:(Je devrais pouvoir glaner des information avec mon PC de Gamer. ͡° ͜ ʖ ͡° ) 
    {SpamePC <= 3:
    ruby:{L’écran est figé sur "PigCraft", sur mon "Snouting" coincé au milieu d'un champ de lave... °-°|Il met son casque, lance Discord, mais aucun de ses potes n’est connecté... >_<|Il commence à demander à GPT "Comment survivre à une bombe atomique...}
    ruby:{Classique. ¬_¬|Pas grave, je suis un cochon autonome, moi! ^_^|"Mettez des lunettes de soleil et garder un sourire convaincant pour que personne ne remarque que vous êtes aussi paumé que tout le monde".}   
    ruby:{Sa m'apprendra à traider avec se "steav"... -_-|... ;-;|C'est le type de conseille qui servirait plus à Mathéo sa. ¬‿¬}
    {SpamePC <= 1:
    pico:{Tu pense vraiment que c'est le moment de faire ça?|Tu voudrais pas faire des recherches sur comment on survie à un se cataclisme?}
    }
    {SpamePC == 3}matheo:Je ne voie as de quoi tu parle...
    ruby:{Un bruit similaire au décolage d'un faucon millenium se fait entendre de puis la tour...|Le bruit se fais plus important qu'avant...|La tour vrombie et émane une chaleur inquétante!}
        ~ SpamePC = SpamePC+1
    }
    
    {SpamePC == 3:
    rubi:J'ouvre le boîtier : un vieux tissu est coincé dans le ventilo, vestige d’un nettoyage raté.
    Vous trouvez des **Morceau de rideau ignifugé**
    rubi:ça pourrait servir...    
        ~ Matériaux = "source 1"
    }
    
    {SpamePC >= 4:
    Le PC est démonté. -_-
    Et je ne pense pas avoire le temps de le réparer... ^-^
    {~(Ni de jouer d'ailleur. ¬_¬)|J'airais peut être due effacer mon historique... °x°|J'espaire que les circuit tiendron après coup, se gaze est peux être corosif... T_T}
    }
    -> Interrieur

++ [Mathéo Chon]
{~(C’est étrange de revenir ici… tout a l’air plus petit.)|(La déco n’a pas bougé d’un poil. Même le vase moche est encore là.)|(Je sais même plus où j'avais planqué mes vieux jouets... peut-être sous le canapé ?)}
matheo:(Bon, on n’est pas là pour se perdre dans les souvenirs. Faut chercher un truc utile.)

{SpameCuisine < 3:
matheo:(Je vais fouiller la cuisine. Avec un peu de chance, Ruby a laissé traîner quelque chose…)

{SpameCuisine == 0:
    matheo:(Je soulève un torchon... une vieille planche à découper en bois bien épaisse.)
    matheo:(Celle-là, elle a connu la guerre…)
    matheo:(On pourrait s’en servir comme planche de renfort ou même pour caler la trappe.)
    ~ Matériaux = "source 2"
}
{SpameCuisine == 1:
    matheo:(Un tiroir rempli de sachets de sauce, et un élastique à cheveux...)
    matheo:(Je crois que j’ai touché la réserve de "survie" de Ruby.)
}
{SpameCuisine >= 2:
    matheo:(Franchement, à part du gras sur les murs et de la poussière sous l’évier...)
    matheo:(J’ai fait le tour.)
}
~ SpameCuisine += 1
-> Interrieur
}

{SpamePC >= 3:
matheo:(Ruby a toujours son PC à fond... ça vibre jusque dans les murs.)
matheo:(Je pourrais jeter un œil... enfin, si je veux me faire engueuler.)

ruby:Tu touches pas, Mathéo.
matheo:Je regarde, c’est tout.
pico:{~(Tu regardes toujours avec les mains, c’est connu.)|(Il va finir par te bloquer l’accès à vie.)}

matheo:(Ok, ok... je touche à rien. Mais j’aurais pu aider, hein.)
-> Interrieur
}
+ [Fouiller l'étage]
Les trois frères grimpent à l'étage, chacun avec sa propre idée en tête.

++ [Pico Chon]
pico:(C'te rambarde... toujours branlante.)
matheo:{~Tu veux que je t’aide, vieux ?|T’as pris un coup de vieux ou c’est l’escalier ?}
pico:Non, non... juste des souvenirs qui grincent plus fort que les marches.
pico:(Tiens... la chambre d’amis. C’est là que je planquais mes cigares à l’époque.)
pico:(Boîte à couture... paire de chaussettes dépareillées... ah !)
pico:(Un vieux masque à gaz de carnaval. Genre cochon mutant des années 80.)
ruby:{~Stylé. Tu le portes, j’te filme pour mon reel.|T’as mis ça au bal de fin d’année ?}
pico:{~Nan, mais je crois que j’ai dragué avec.|Et j’ai eu un rancard grâce à ça, triste époque.}
pico:(Bon... pas de filtre, ni de cartouche. Ça servira à rien, à part faire flipper Mathéo.)
matheo:{~...Je suis juste là hein.|Je vous entends.}
-> Interrieur

++ [Ruby Chon]
ruby:(Si j’étais une maman prévoyante... j’aurais rangé les trucs précieux à l’abri. Donc... placard du couloir ?)
ruby:(*clic clac*... bloqué.)
ruby:(Pas grave. Opération "tournevis et finesse".)
pico:{~Tu forces la porte de ta propre maison ?|T’as oublié que t’habites ici ?}
ruby:Je ne force pas, j’investigue avec style.
ruby:(Et... bingo. Une caisse marquée "camping 2009".)
ruby:(Rien que du vieux matériel... et ça ? Une couverture de survie !)
ruby:{~Pliable, isolante... résistante.|On fait avec ce qu’on a.}
pico:{~Ça a protégé ton cul d’une invasion de moustiques, ça protègera peut-être de l’arme chimique.}
ruby:On verra... Si on finit pas en sandwich grillé, je la brevète.
~ Matériaux = "source 8"
-> Interrieur

++ [Mathéo Chon]
matheo:(Cette maison a trop changé... Où est passé mon poster de "Porc Wars VII" ?)
matheo:(Bon, je vais regarder dans la salle de bain, j’crois que j’avais caché des trucs utiles dans le panier à linge à l’époque.)

ruby:{~Utiles genre ?|Des mouchoirs à paillettes ?}
matheo:Genre... un sèche-cheveux. Tu sais, pour détourner les gaz ? Avec l’air chaud ?
pico:{~…C’est pas comme ça que ça marche, frangin.|Tu comptes sécher le nuage toxique ?}
matheo:(Ben au moins j’essaie. Et... oh non.)
matheo:(Un vieux gel coiffant, périmé de 8 ans. Liquide. Collant.)
matheo:{~Beurk.|C’est vivant ou c’est censé être comme ça ?}
matheo:(J’ai les mains gluantes maintenant. Super. Super.)
-> Interrieur

+ [Dernier tour de l’étage]
Ils décident de ne pas laisser une armoire ou un recoin tranquille.

++ [Pico Chon]
pico:(La chambre de maman... Hmm. Interdit d’y entrer après 22h quand on était gamins.)
pico:(Mais aujourd’hui, c’est la guerre. Ou un mardi bizarre.)
matheo:{~Tu vas fouiller ses tiroirs ?|Si elle rentre, t’es mort.}
pico:Elle serait la première à vouloir qu’on survive.
pico:(Bon... Tiroir du bas. Parfum, lettres, photos... une boîte de fer.)
pico:(...Encore une boîte vide.)
pico:(Et pas même une goutte de gnôle.)
ruby:{~T’as fouillé plus pour l’alcool que pour le matériel ?}
pico:{~Chacun sa mission, moi je cherche à calmer mes nerfs.}
-> Interrieur

++ [Ruby Chon]
ruby:(Bon, ça devient une vraie quête. Même les RPG ont plus de loot.)
ruby:(Y’avait un coffre dans la chambre de Mathéo, planqué sous son lit à baldaquin bidon.)
ruby:(Qu’est-ce que t’as mis là-dedans en 2015, frangin ?)
matheo:{~Des secrets !|...Peut-être mon journal intime.}
ruby:(Allez hop. *force un peu*)... ah, un coussin de massage portable. Sérieux ?
ruby:(Et... du sable. Pourquoi y’a du sable ?)
matheo:{~C’était mon "kit de plage intérieur".|Tu comprenais pas, t’étais trop cartésien.}
ruby:{~Bon bah je retourne bredouille.|Je note : ne plus rien fouiller de ton côté.}
-> Interrieur

++ [Mathéo Chon]
matheo:(OK, dernière chance. Je tente le grenier.)
pico:{~Tu vas finir avec un toit sur la tête.|Tu sais même pas comment on y monte.}
matheo:(Si, si ! Avec... la chaise, puis l'étagère, puis le coffre... ok, c’est casse-gueule.)
ruby:{~Arrête, on n’a pas l’assurance.|Mais vas-y.}
matheo:(Hop, hop—*CRAC*) AÏE !
matheo:(...C’était mon genou ou la trappe ?)
matheo:(Bon, j’ai rien vu, mais j’ai trouvé... un bonnet de Noël ?)
matheo:{~Ça couvre la tête.|...Et le cerveau, c’est là que tout se passe. CQFD.}
-> Interrieur

+ [Sortir]
-> ActionPrincipale

== Cave ==

+ [Action 1]
++ [Pico Chon]
-> Cave

++ [Ruby Chon]
-> Cave

++ [Mathéo Chon]
-> Cave

+ [Action 2]
++ [Pico Chon]
-> Cave

++ [Ruby Chon]
-> Cave

++ [Mathéo Chon]
-> Cave

+ [Action 3]
++ [Pico Chon]
-> Cave

++ [Ruby Chon]
-> Cave

++ [Mathéo Chon]
-> Cave

+ {Matériaux != "Aucun"} [Réparer le bunker] Vous appliquer "???" au bunker
~ Bunker = true
-> Cave

+ {Bunker == true} [Fermer le bunker] Vous fermer et attender la fin...
{Matériaux == "Aucun"}
-> END
{Matériaux == "source 1"}
-> END
{Matériaux == "source 2"}
-> END
{Matériaux == "source 3"}
-> END
{Matériaux == "source 4"}
-> END
{Matériaux == "source 5"}
-> END
{Matériaux == "source 6"}
-> END
{Matériaux == "source 7"}
-> END
{Matériaux == "source 8"}
-> END
{Matériaux == "source 9"}
-> END
{Matériaux == "source 10"}
-> END
{Matériaux == "source 11"}
-> END
{Matériaux == "source 12"}
-> END
{Matériaux == "source 13"}
-> END
{Matériaux == "source 14"}
-> END
{Matériaux == "source 15"}
-> END
{Matériaux == "source "}

+ [Sortir]
-> ActionPrincipale

// Ruelle //
== Antiquaire ==

//{~(La boutique de l'antiquaire sent la cire chaude et les souvenirs oubliés.)|
//(Des rayonnages croulent sous des objets poussiéreux aux origines incertaines.)|
//(Une horloge ancienne tique fort, comme pour rappeler que le temps presse.)|
//(Le parquet grince à chaque pas, semblant gémir sous le poids de siècles de secrets.)|
//(Un étrange phonographe joue une musique triste et désaccordée, sans qu’on sache d’où elle vient.)}

+ [Observer les articles]

++ [Pico Chon]

pico: (Hmm... ça sent le vieux rhum par ici, ou c’est juste mon foie qui espère ?)
pico: (Tiens... une boule à neige représentant un loup dans un champ de saucisses.)
pico: (Je me demande ce que ça veut dire…)

antiquaire: {~Vous avez l'œil, monsieur. Cette pièce vient d’une époque… révolue.|Elle appartenait à un général loupgarou, paraît-il. Symbolique, vous voyez ?}

pico: {~Symbolique de quoi ? D’un buffet ?|(J’ai connu des soirées plus claires que vos explications.)}
~ PicoRuby -= 1

-> Antiquaire

++ [Ruby Chon]

ruby: (Que des antiquités... Peut-être que certaines ont de la valeur sur PorcBay.)
ruby: (Ce miroir... oh, c’est pas un miroir. Juste une plaque en métal poli.)
ruby: {~Est-ce qu’on peut hacker un gramophone ?|Je pourrais le démonter pour pièces.}

antiquaire: {~Je vous conseille d’éviter de toucher, jeune homme.|Certains objets ont... des humeurs.}

ruby: (Cool. Un gramophone hanté. Super rassurant.)
~ RubyMathéo -= 1

-> Antiquaire

++ [Mathéo Chon]

matheo: (C’est genre... un musée, ici ? On paie à la sortie ?)
matheo: (Un masque tribal... avec un groin sculpté. Est-ce que ça me va bien ?)

ruby: {~T’as mis ça à l’envers, Einstein.|On dirait un saucisson avec des yeux.}

matheo: (J’prends ça pour un compliment.)
~ MathéoPico += 1

-> Antiquaire

+ [Discussion avec Gustave Verleporc (Antiquaire)]

++ [Pico Chon]

pico: (Je le sens mal ce type. Trop poli pour être honnête.)
antiquaire: {~Vous avez l’air... expérimenté. Amateur de grands crus, peut-être ?}
pico: (Oh... il m’a cerné vite lui.)

antiquaire: {~Je collectionne aussi les vieilles bouteilles. Certaines contiennent des secrets. D’autres... du vinaigre.}

pico: {~Et si je vous donnais un secret, vous me filez un truc utile ?|(Vous achetez les souvenirs aussi ?)}
~ PicoRuby -= 1

-> Antiquaire

++ [Ruby Chon]

{RubyMathéo >= 2:
    ruby: (Je pourrais le scanner en douce pour détecter s’il cache de la crypto physique...)
    pico: {~Tu veux pas scanner les objets plutôt ?|T’es pas dans un escape game.}
    ruby: (Trop tard, j’ai lancé l’analyse thermique.)
    antiquaire: {~Il repère une zone chaude derrière une étagère. Ruby note l’endroit, mais ne dit rien.}
    ~ RubyMathéo += 1
}

antiquaire: {~La technologie vous intéresse ? J’ai une machine à écrire à vapeur, si cela vous tente.}
ruby: (Je parie qu’elle mine du Bitcoin vintage...)
~ RubyMathéo += 1

-> Antiquaire

++ [Mathéo Chon]

matheo: (Salut monsieur, c’est ouvert ou vous faites semblant d’être occupé ?)
antiquaire: {~Je suis toujours ouvert aux âmes curieuses...|}
matheo: {~C’est pour un bunker anti-bacon... Vous auriez une trappe ?|Genre, un truc blindé, ou des oreillers magiques ?}

antiquaire: {~Rien d’aussi précis, hélas. Mais peut-être quelque chose qui *protège de l'intérieur*...}

matheo: (Genre une couverture ? Un coussin ? Un câlin ?)
~ MathéoPico += 1

antiquaire: {~...Revenez quand vous aurez un peu plus de... discernement.}
~ MathéoPico -= 1
-> Antiquaire

+ [Marchander la Lampe]

Un objet mystérieux est visible sur le comptoir : une **lampe à huile ancienne**, couverte d’inscriptions.

antiquaire: {~Une pièce unique... elle exauce les vœux, dit-on.|Mais attention : tout vœu a un prix. Parfois bien plus que ce qu’il promet.)}


++ [Pico Chon]

pico: (Ça brille... Ça me tente... mais je sens que je vais le regretter.)
{PicoRuby >= 2:
    pico: (Je vais essayer la méthode douce.)
    antiquaire: {~Vous semblez... sincère. Je vous la laisse, mais prenez-en soin.}
    ~ Lampe = true
    ~ PicoRuby += 1
}

{PicoRuby < 2:
    antiquaire: {~Je crains que vous ne soyez pas prêt pour cette responsabilité.}
    pico: (Bah... tant pis. J’ai déjà trois regrets, un de plus...)
    ~ PicoRuby -= 1
}
-> Antiquaire

++ [Ruby Chon]

ruby: (C’est probablement un piège magique. Je devrais la scanner.)
antiquaire: {~Vous voulez la démonter ? Quelle horreur...}

{RubyMathéo >= 3:
    ruby: (Mais elle contient une sorte de capsule d’énergie scellée !)
    ruby: (Ok. Je tente le coup.)
    ~ Lampe = true
    ruby: (Je jure que si ça explose, je te traque en fantôme.)
    ~ RubyMathéo += 1
}

{RubyMathéo < 3:
    ruby: (Mouais... pas assez d’info. Trop risqué.)
    ~ RubyMathéo -= 1
}
-> Antiquaire

++ [Mathéo Chon]

matheo: (Elle est trop stylée, je la veux.)
antiquaire: {~Et pourquoi vous la voulez, jeune homme ?}
matheo: {~Pour l’offrir à une fille...|Pour la mettre dans le bunker ! Elle brillera quand on sera dans le noir !}

{MathéoPico >= 2:
    pico: (Ok, je te couvre si tu veux tenter une négo.)
    antiquaire: {~...D’accord. Mais attention à ce que vous souhaitez.}
    ~ Lampe = true
    ~ MathéoPico += 1
}

{MathéoPico < 2:
    antiquaire: {~Revenez avec un parent, peut-être.}
    matheo: (…C’est discriminant.)
    ~ MathéoPico -= 1
}
-> Antiquaire

+ [Sortir]
-> ActionPrincipale

== Clochard ==

+ [Discution] Discute avec Clochard 5
++ [Pico Chon]
-> Clochard

++ [Ruby Chon] 
{Cafeine == false}Vous tenter une approche, mais sans succés...
{Cafeine == true}Vous lui apprenner la crypto money ...
~ CryptoMoney = true
-> Clochard

++ [Mathéo Chon]
-> Clochard

+ [Le raquetter] Qui met à taba le clodo ?
++ [Pico Chon]
-> Clochard

++ [Ruby Chon]
-> Clochard

++ [Mathéo Chon]
-> Clochard

+ [Action 3]
++ [Pico Chon]
-> Clochard

++ [Ruby Chon]
-> Clochard

++ [Mathéo Chon]
-> Clochard

+ [Sortir]
-> ActionPrincipale

== Ruine ==

+ [S’enfoncer dans les ruines]
Le trio franchit un muret effondré. Une brise traverse le béton fendu, soulevant poussière et soupirs.

++ [Pico Chon]
pico:(Y’a une époque, j’me serais planqué ici pour échapper à une engueulade.)
matheo:(Ou à une dette.)
pico:Non, là c’était plutôt pour éviter de faire les devoirs... ou les lessives.
ruby:(Tu faisais des lessives, toi ?!)
pico:Non, mais maman me faisait croire que j’étais responsable. J’étais jeune et naïf... maintenant je suis juste vieux.
matheo:Tu penses qu’il y a des bestioles là-dedans ?
pico:Si c’est le cas, elles boivent peut-être mieux que moi ces derniers temps...

-> Ruine

++ [Ruby Chon]
ruby:(Ces murs tiennent debout par pure flemme de tomber.)
pico:(Comme toi le matin.)
matheo:Moi j’aime bien, ça sent le mystère... ou l’ammoniaque.
ruby:Non mais sérieux, y’a une odeur d’isolant cramé. Y’a peut-être eu un court-circuit.
pico:Ou un ancien squat. J’parie qu’on va tomber sur un vieux matelas et un calendrier de 2012.
ruby:Ou un tableau électrique encore sous tension...
pico:(S’il explose, tu pourras dire adieu à ta carrière de streamer.)
ruby:(Ce serait un drame national.)

-> Ruine

++ [Mathéo Chon]
matheo:(Pourquoi on passe pas juste par le toit ?)
ruby:C’est un plan brillant... si on veut finir la journée en plâtre.
pico:Et surtout si tu veux retrouver maman en chaise roulante.
matheo:(Moi j’dis juste, y’a plus de lumière en hauteur.)
ruby:(Tu veux bronzer ou explorer, là ?)
matheo:Un peu des deux. T’façon, ça pue et j’vois rien.
pico:Voilà un vrai explorateur : motivé par l’esthétique et l’odorat.

-> Ruine

+ [Explorer les décombres]
Les cochons contournent un pilier effondré, puis s’enfoncent dans un couloir envahi par les gravats et les mauvaises herbes. L’air est plus sec, plus dense.

++ [Pico Chon]
pico:(Ça sent le moisi et la promesse d’un tétanos carabiné.)
matheo:(Je crois que j’ai marché sur un truc vivant...)
ruby:Je parie que c’était juste ta conscience.
pico:(Attends, y’a une boîte métallique là, coincée sous ce béton.)
ruby:Tu vas pas l’ouvrir à mains nues ?
pico:On est dans une course contre la montre, pas dans un tuto bricolage.
pico:...C’est vide. Et rouillé. Super. Même les rats ont fait faillite ici.
matheo:Peut-être que c’était un piège ?
ruby:Le piège, c’est qu’on est venus fouiller ce coin.

-> Ruine

++ [Ruby Chon]
ruby:(Ok, j’analyse la structure : du béton fissuré, traces d’humidité, conduits éventrés. Rien de récupérable sans risquer une pluie de gravas.)
pico:Toujours aussi rassurant...
matheo:Et moi qui voulais me lancer dans la rénovation.
ruby:(Y’a un vieux boîtier de relais là, sous le panneau de câbles. Je tente.)
ruby:Tousse... Ok. J’ai juste activé le générateur d’asthme.
pico:(On va ressortir de là avec des poumons couleur réglisse.)
ruby:Bon... rien ici non plus. On avance ?

-> Ruine

++ [Mathéo Chon]
matheo:(C’est moi ou j’ai vu une silhouette passer là-bas ?)
ruby:C’est juste l’ombre de ton ego.
pico:Non, attends. Y’a peut-être un passage derrière ces planches.
matheo:Yes ! Un passage ! ...vers une pièce encore plus vide.
ruby:(Un peu comme ton cerveau après minuit.)
matheo:Franchement, j’aurais juré voir quelqu’un...
pico:Ouais, ben si t’as une hallucination utile, genre une bouteille d’eau ou un filtre à gaz, préviens-nous.

-> Ruine

+ [Tenter d’ouvrir la porte rouillée]
Un pan de mur est resté debout, encadrant une porte en métal tordue et rongée par le temps.

++ [Pico Chon]
pico:(On dirait la réserve d’un ancien dépôt... ou un local de maintenance.)
ruby:Vu l’état, c’est surtout un local à microbes.
matheo:Ça peut pas être pire que les toilettes publiques du "Groin Merlin".
pico: je vais tenter de le forcer...
pico:Mpf...(J’ai connu des bouchons de carafe plus coopératifs...)
pico:On va faire comme à l’ancienne. Le métal contre le métal.
//(CLANG – la porte cède brutalement, projetant Pico en arrière.)
pico:...J’vais dire que c’était prévu.
//(À l’intérieur : des outils fondus, des câbles à nu, et un tas de gravas noirâtres.)
ruby:Rien de récupérable ici, sauf si tu veux collectionner le plomb fondu.
matheo:Je peux le peindre et dire que c’est de l’art brut ?
pico:J'aurais pas dit mieux !

-> Ruine

++ [Ruby Chon]
ruby:(Je scanne la pièce. Étrange, il y a un petit boîtier accroché au mur, genre tableau de fusibles.)
matheo:Si tu déclenches un piège, je prends pas la responsabilité.
pico:C’est pas Zelda, c’est une ruine...
//(Ruby s’approche, l’ouvre délicatement.)
ruby:...Un vieux compartiment de stockage. Vide, à part...
//(Il attrape une pochette plastifiée.)
ruby:...des schémas techniques. Trop endommagés. Inexploitables.
pico:(Y’a un mot dessus ?)
ruby:"Protocole de désactivation du ventilateur 9B"...
matheo:Cool. Maintenant on a de quoi réparer une machine qu’existe sûrement plus.
ruby:(Oui, mais au moins j’ai trouvé **quelque chose**. C’est la démarche qui compte.)
pico:(On mettra ça sur le frigo.)

-> Ruine

++ [Mathéo Chon]
matheo:(Attendez, y’a un truc coincé dans le plafond effondré là-haut...)
ruby:Ne grimpe pas.
pico:Je vois déjà ton épitaphe.
//(Mathéo saute... puis trébuche.)
matheo:Je suis bien, c’était calculé.
//(Il attrape un vieux câble relié à... rien. Il tire quand même.)
//(Un vieux néon lui tombe dessus avec un bruit de carillon mou.)
matheo:...J’ai trouvé de la lumière. En kit.
ruby:On va tous mourir, mais au moins t’auras laissé ton empreinte.
pico:(On bouge avant que le plafond décide de finir le boulot.)

-> Ruine

+ [Sortir]
-> ActionPrincipale

//Place du village//
== Puit ==

+ [Regarder dans le puits]

++ [Pico Chon]
pico:(Y’a des trucs qu’on fait par réflexe… comme se pencher au-dessus d’un puits vide quand tout s’écroule autour.)
ruby:Fais gaffe, la dernière fois t’avais glissé dedans en hurlant "je suis un triton"…
matheo:C’est parce qu’il avait bu, non ?
pico:Ou peut-être que je faisais des recherches sur la résonance acoustique.
ruby:Oui. Et moi je suis l’inventeur de la roue carrée. ¬_¬
pico:(Bon, voyons… rien qu’un fond noir, et un écho triste quand je lâche une pièce imaginaire.)
-> Puit

++ [Ruby Chon]
ruby:(Un puits. Ancienne méthode de captation d’eau potable, profondeur moyenne…)
pico:Tu veux qu’on t’imprime Wikipédia ?
ruby:(J’analyse les parois, il y a des inscriptions à moitié effacées.)
matheo:Genre "ici repose l’ennui" ?
ruby:(Plus ancien. Peut-être des glyphes pré-sauciers… Ou alors une pub gravée pour un dentifrice.)
ruby:Résultat : humidité élevée, taux de gaz faibles, présence de mousse et de... bulles ?
matheo:De la mousse ? C’est peut-être une vieille bière sacrifiée ?
pico:(S’il y a un fût au fond, je saute.)
-> Puit

++ [Mathéo Chon]
matheo:(On peut boire l’eau du puits ? J’ai soif.)
ruby:Non. Et probablement irradiée.
pico:Pas sûr que le gaz fasse effet sous l’eau, remarque…
matheo:(Si je construisais une mini cabane au fond, comme dans "Bouffi et les sept marmots" ?)
ruby:Tu vas surtout glisser, tomber, et choper une pneumonie post-apocalyptique.
matheo:ALLÔÔÔÔÔ… ! J’AI UN ABRICOT POUR LE MAIRE !
pico:(…On l’a perdu.)
ruby:(Ça fait longtemps.)
-> Puit

+ [Inspecter les abords du puits]

++ [Pico Chon]
pico:(Y’avait un vieux banc ici, non ? Où on attendait maman quand elle faisait le marché…)
ruby:Il est là. Enfin… ce qu’il en reste.
matheo:(On dirait un tas de brindilles qui a vu la guerre.)
pico:(C’est un peu notre cas aussi, non ?)
ruby:Poétique. Et inquiétant venant de toi.
pico:(Sous le banc… tiens ?)
{Halcoole == false:
pico:(Une bouteille vide. Pas à moi. Trop propre.)
matheo:C’est un signe ! Le bunker doit être construit ici !
ruby:Arrête d’écouter les bouteilles…
}
{Halcoole == true:
pico:(Un bouchon coincé dans les lattes du banc.)
pico:(Je reconnais la marque… C’est celle que je cachais là, gamin…)
pico:(Je suppose qu’on devient tous nos propres parents, hein ?)
-> Puit
}

++ [Ruby Chon]
ruby:(Les pavés sont disjoints… comme les connexions neuronales de Mathéo.)
matheo:Je préfère les pavés au riz, c’est plus croustillant.
pico:(Tu veux pas aller déranger les fourmis au lieu de déranger ton frère ?)
ruby:(Non, justement, y’a un truc sous les pavés. On dirait… un boîtier.)
{SpamePC >= 3:
ruby:(Une vieille prise Ethernet rouillée. Inutilisable. Mais stylée.)
pico:C’est pas une antiquité, c’est un hommage.
-> Puit
}
{SpamePC < 3:
ruby:(Un sachet plastique contenant une pile et un câble USB… Pourquoi ?)
matheo:C’est sûrement un piège.
ruby:Ou un début de chargeur maison… Allez, je prends.
~ Matériaux = "source 8"
-> Puit
}

++ [Mathéo Chon]
matheo:(J’essaie de déplacer un vieux pot de fleurs… ou un truc qui lui ressemble.)
ruby:Tu veux réaménager la place ?
matheo:Non, mais ce pot me regarde bizarrement.
pico:C’est un caillou, Mathéo.
matheo:(Ouais ben il était louche. Et creux…)
{Halcoole == false:
matheo:(Rien dedans. Que du vide et de la poussière.)
matheo:Comme mon compte crypto…
-> Puit
}
{Halcoole == true:
matheo:(Oh ! Une capsule de bière scellée dans la terre.)
matheo:Tu crois qu’on peut la replanter pour en faire pousser d’autres ?
pico:(...On tente le coup après la fin du monde.)
-> Puit
}

+ [Essayer de puiser de l’eau]

++ [Pico Chon]
    pico:Bon, voyons si ce vieux puits peut encore nous filer un coup de main.
    {RANDOM(1,4):
        - 1:
            pico:(C’est pas de l’eau, c’est de la boue en bouteille…)
            ruby:(Pourquoi t’as foutu ta patte là-dedans ?)
            matheo:(Tu veux qu’on la boive ou qu’on s’y baigne ?)
            ~ PicoRuby = -1
            -> Puit
        - 2:
            pico:C’est profond… et sec. Génial.
            ruby:Tu veux qu’on creuse à la main ?
            pico:Ou qu’on prie pour une averse.
            -> Puit
        - 3:
            pico:Tient ! Une vieille gourde... pleine ?
            ruby:(Qui laisse ça là-dedans ?)
            Vous obtenez **Gourde hermétique d’avant-guerre**
            ~ PicoRuby = 1
            -> Puit
        - 4:
            pico:(J’ai attrapé un truc gluant… et vivant ?)
            ruby:(Beurk… faut désinfecter ça.)
            matheo:(Y’avait un crapaud !)
            ~ PicoRuby = -1
            -> Puit
    }

++ [Ruby Chon]
    ruby:On va voir si je peux trouver de quoi nous hydrater, version post-apo.
    {RANDOM(1,4):
        - 1:
            ruby:J’ai réussi à en remonter un peu… ça sent bizarre.
            pico:Si tu commences à voir des éléphants roses, t’avertis.
            Vous obtenez **Flacon d’eau stagnante**
            -> Puit
        - 2:
            ruby:(Y’a de l’eau, mais le seau a disparu… super.)
            matheo:Tu veux que je descende avec une corde ?
            ruby:(Et finir coincé à vie ? Non merci.)
            -> Puit
        - 3:
            ruby:(C’est juste une flaque de vase au fond…)
            matheo:(T’as pas trouvé un têtard mort ?)
            ruby:(Non. Mais toi, tu peux peut-être y vivre…)
            ~ RubyMathéo = -1
            -> Puit
        - 4:
            ruby:Oh, une gourde ! Fermée, en plus…
            matheo:(On peut boire ?)
            ruby:(On va tester d’abord…)
            Vous obtenez **Gourde hermétique d’avant-guerre**
            ~ RubyMathéo = 1
            -> Puit
    }

++ [Mathéo Chon]
    matheo:Je gère. L’eau, c’est mon élément… ça et le gel coiffant.
    {RANDOM(1,4):
        - 1:
            matheo:(C’est plein de vase et y’a un têtard qui m’a regardé.)
            ruby:(Ce puits est plus vivant que toi…)
            pico:(On va le boire ou le baptiser ?)
            ~ RubyMathéo = -1
            -> Puit
        - 2:
            matheo:(Y’a de l’eau au fond, mais pas de seau.)
            pico:Et pas de neurones pour improviser.
            ruby:(On aura tout tenté… sauf l’intelligence.)
            -> Puit
        - 3:
            matheo:Regardez ! Une gourde toute propre !
            ruby:(Gourde comme toi, mais utile celle-là.)
            Vous obtenez **Gourde hermétique d’avant-guerre**
            ~ RubyMathéo = 1
            -> Puit
        - 4:
            matheo:(J’ai tiré la corde, j’ai tiré… et j’ai arraché la manivelle.)
            pico:(Ce puits est comme toi : cassé.)
            ruby:(Va falloir réparer... un jour.)
            ~ MathéoPico = -1
            -> Puit
    }

+ [Sortir]
-> ActionPrincipale

== Mairie ==

+ [Action 1]
++ [Pico Chon]
-> Mairie

++ [Ruby Chon]
-> Mairie

++ [Mathéo Chon]
-> Mairie

+ [Discuter] Discute avec ??? 6
++ [Pico Chon]
-> Mairie

++ [Ruby Chon]
-> Mairie

++ [Mathéo Chon]
-> Mairie

+ [Discuter] Discute avec ??? 7
++ [Pico Chon]
-> Mairie

++ [Ruby Chon]
-> Mairie

++ [Mathéo Chon]
-> Mairie

+ [Sortir]
-> ActionPrincipale

== Marcher ==

+ [Action 1]
++ [Pico Chon]
-> Marcher

++ [Ruby Chon]
-> Marcher

++ [Mathéo Chon]
-> Marcher

+ [Action 2]
++ [Pico Chon]
-> Marcher

++ [Ruby Chon]
-> Marcher

++ [Mathéo Chon]
-> Marcher

+ [Action 3]
++ [Pico Chon]
-> Marcher

++ [Ruby Chon]
-> Marcher

++ [Mathéo Chon]
-> Marcher

+ [Sortir]
-> ActionPrincipale


//Allée commercante//
== AuChamp ==
pierre: {~Oh. C’est vous... faites pas trop attention au bazar.|Les frères Chon !|Ah, je croyais que c’était la livraison...}
pierre: Bienvenue {~chez Au Champ.|, c’est pas grand, mais au moins c’est... ouvert.|, vous tombez un peu mal, j’ai reçu un stock entier de pâtes... sans étiquettes...}
pierre: {~Vous n'êtes pas venus pour le retour des cornichons en gelée, si ?|Vous allez acheter, ou juste critiquer mes pyramides de boîtes ?|Faites attention en marchant, j’ai pas encore netoyer le sol du rayon 8.}

matheo: {~Eh Pierre,|Salut gars,}{~ t’as changé de shampoing ou t’as juste arrêté d’être rose ?|Comment va le deuxiemme mec le plus virile du vilage ?}

pierre: Bien,{Heu... j’ai la peau sensible... donc j'ai interret à entretenire cet fourure, c’est... de famille.|???}

ruby: (chuchote à Pico) C’est moi ou son masque bouge à chaque mot ?

pico: (hausse un sourcil) Chut. Il est gentil, mais il a l’air de vivre dans un stress permanent.

pierre: (regarde autour) J’ai pas grand-chose de neuf... mais j’peux peut-être vous trouver un ou deux trucs... utiles... peut-être.

ruby: (sourit) Tu caches des matériaux secrets derrière les boîtes de sardines, c’est ça ?

pierre: (gêne visible) Non... enfin… pas exactement. Mais si vous m’aidez à... heu... remettre en rayon les conserves du fond, je peux... voir ce que je peux faire.

pico: (voix douce) Détends-toi, vieux. On est juste là pour bricoler un abri. Pas pour t’envoyer au tribunal du marché.

pierre: (hoche la tête rapidement) Ouais... ouais, j’sais... merci.

+ [Action 1] L'AIDER A RANGER LES RAYON, DECRIRE L'ETAT LAMENTABLE DU LIEU

++ [Pico Chon] 
    {DeceptionPierre == 2:
    pico: Si tu veux je peux...
    pierre: Non !
    pierre: Là c’en est trop, Stop !
    pierre: C’est du sabotage à se niveaux, pas du rangement !
       {DeceptionPierre >= 2:
        pico: {~(J'aimerais éviter d'avoire des acroc avec se type...)|(j'ai plus moyen de me ratraper...)|(Ce n'est pas une bonne idée...)}
        }
        -> AuChamp
    }
    {DeceptionPierre <= 1:
    pico:{~(J’vais ranger ça à l’instinct... comme les bouteilles dans la cave.)|(Les cornichons à côté des biscuits apéro..., une synergie gustative parfaite pour les soiré bien arosé !)|(Si j'empile ses boîtes...)}
    //mais tout s'écroule sur une mamie qui passait. Oups.
    }
    {DeceptionPierre == 0:
    pierre: {~Heu... |Bon...|Merci Pico...}
    pierre: {~C’était une approche… originale !|C’est... surprenant, on va dire...}
    pierre: {~Pas catastrophique...|Tu sais quoi, je reverrais ce rayon plus tard.| Merci.(on va dire ?)}
    {DeceptionPierre == 1:
    pierre: Mais...
    pierre: {~Là, j’commence à douter de ton aide...|Je crois que c’est pas votre rayon... sans mauvais jeu de mot.|La prochaine fois... (En fait j'aimerais qu'il y en ai pas en faite...)}
    }
    }
    ~ DeceptionPierre += 1
        -> AuChamp

++ [Ruby Chon] 
    {DeceptionPierre == 2:
    ruby: Si tu veux j’peux...
    pierre: Non non non, Ruby, t’es mon dernier espoir.
    pierre: Si t’y arrives pas, j’ferme boutique et je pars ouvrir une ferme de tofu.
    ruby: (…Wow, pas de pression, hein.)
        // Ruby réussit à tout remettre en ordre avec style
        ruby:{~(Bon, activateur de compétences "Ctrl+Z", c’est l’heure du skill...)|(Allez, Ruby, canalise ton Feng Shui intérieur.)|(Range les conserves par forme hexadécimale, ça devrait le faire...)}
        pierre: {~(Nom d’un jambonneau...)|Wouah...|J’y crois pas...}
        pierre: {~On dirait un vrai magasin, maintenant !|C’est beau comme un fichier Excel bien rempli...|J’ai presque envie de rester après mon service... presque.}
        //~ MateriauAuChamp = true
        ~ DeceptionPierre = 0
        //~ AideRuby = true
        -> AuChamp
    }

-> AuChamp

++ [Mathéo Chon] 
    {DeceptionPierre == 2:
    matheo: Je peux en remettre une couche si tu ve...
    pierre: T’as déjà transformé le rayon fruit en parcours du combattant !
    pierre: Si tu touches à ne seraice qu'à un yaourt de plus !
    pierre: Je te catapulte avec se chariot j'usqu'au Perault!
        {DeceptionPierre >= 2:
        matheo:{~(Eviton le quelque temps...)|(Pierre a les veines qui gonflent comme mes pecs rien qu'à ma vue!)|(C’est pas le le moment, il est de mauvais poile...)}
        }
        -> AuChamp
    }
    {DeceptionPierre <= 1:
    matheo: {~(C’est parti pour "Fitness & Rayonage" intesif !)|(Un p’tit deadlift de conserve et se sera vite plier.)|(Ranger ou montrer ses biscotos, et pourquoi pas les deux ?)}
    matheo: {~Empilon ses boîtes de raviolis comme un château de cartes...(sa devrait attirer les client)|Ses sacs de patate son parfait pour faire du déveloper.|Petit entrainement au lancer de poids...}
    }
    {DeceptionPierre == 0:
        pierre:{~Bon effort ?|(C’est... dynamique, au moins.)|(On va dire que l’intention y est...)}
        pierre:{~Merci quand même.|On repassera pour la méthode par contre...}
    {DeceptionPierre == 1:
        pierre:{~(Okay, là j’commence à stresser... encore une "idée" comme ça et j’plante tout.)|(Je te l'avait, il va transformer les rayons en salle crossfit !)|(À ce rythme, je vais finir par tout faire moi-même...)}
    }
    }
    ~ DeceptionPierre += 1
    -> AuChamp

+ [Discuter] Discute avec Pierre le loup INFORME ET PEUX REPARLER DE LAIDE DONT IL A BESOIN
++ [Pico Chon] ???
-> AuChamp

++ [Ruby Chon] ???
-> AuChamp

++ [Mathéo Chon] ???
-> AuChamp

+ [Action 3] REGARDE LES RAYON ET PEUVENT CHOISIR UN MATERIAUX QUI POURONT ACHETRER OU RECUPERER VIA UN SERVICE

++ [Pico Chon] NE TROUVE PAS DE MATERIAUX, MAIS NE FAIS PAS CHOUX BLANC
-> AuChamp

++ [Ruby Chon] TROUVE UN MATERIAUX
-> AuChamp

++ [Mathéo Chon] TROUVE UN MATERIAUX
-> AuChamp

+ [Sortir]
-> ActionPrincipale

== Restaurent ==

+ [Boire une boisson] CHOIX DES BOISSON

++ [Pico Chon] A commander du rosée SERA BOURER
-> Restaurent

++ [Ruby Chon] A commander du cola RAFRAICHISSANT RIEN DE PLUS
-> Restaurent

++ [Mathéo Chon] A commander du café RUBY SERA HYPER ACTIFE
~ Cafeine = true
-> Restaurent

+ [Discuté avec "Le chef"] Discute avec "Le chef"
++ [Pico Chon]
-> Restaurent

++ [Ruby Chon]
-> Restaurent

++ [Mathéo Chon]
-> Restaurent

+ [Faire la commission]
++ [Pico Chon] 
{Halcoole == true:
(c'est???)
~ Imbécile = true
-> Restaurent
}
{Halcoole == false:
(Le cuistot lui dit qu'il n'est pas apte à la cuisine..., mais qu'il pourait faire la vaisselle...)
-> Instruction1
}

++ [Ruby Chon] (Lui propose de faire la cuisine, commence à préparer des plats instantané..., le cuistot la vire de la cuisine avec dénie et médisance...)
-> Restaurent

++ [Mathéo Chon] (Le chef lui dit qu'il fait l'affaire en temps que serveur "car il est beau gosse", mais doit comprendre les instructions du chef...)
-> Instruction2

+ [Sortir]
-> ActionPrincipale

=Instruction1
{SpameCuisine >= 5:
(Le cuisto pète un plomb ! Les deux se disputent, puis met le groupe dehors !)
~ Imbécile = true
-> ActionPrincipale
}
(Suite au instruction du chef, il commence à faire la vaisselle...)
~ temp Assiette = RANDOM(1, 3)
    {Assiette == 1:
    (Fini sans acroc)
    (Vous obtener "source 6")
    ~ Matériaux = "source 6"
    }
    {Assiette == 2:
    (Casse {~une Assiette|un verre|une tasse})
    ~ SpameCuisine += 1
    }
    {Assiette == 3:
    (Casse {~trois couverts|quatre couverts|six couverts})
    ~ SpameCuisine += 2
    }
    {Assiette == 4:
    (Casse toute la pile de couvert, et se fait enguirlander par le cuistot)
    ~ Imbécile = true
    -> ActionPrincipale
    }
    -> Restaurent

=Instruction2
{SpameCuisine >= 5:
(Le cuisto pète un plomb ! Les deux se disputent, puis met le groupe dehors !)
~ Imbécile = true
-> ActionPrincipale
}
{SpameCuisine != 5:
(Le cuistot lui explique sa mission...)<>
({1|2|3|4|5})
(Il lui demande s’il a compris ?)
}
+ [Pas compris] (Non, il n’a pas compris... <> {~1|2|3})
    ~ SpameCuisine += 1
-> Instruction2
+ [Compris] (Il a compris et s’exécute...)
(Vous obtenez un reste de pâté en croûte ?)
~ Matériaux = "source 5"
-> Restaurent

== GroinMerlin ==

+ [Discuter] Discute avec Pamela 3

++ [Pico Chon] VA COMMENCER A LUI DEMANDER QUELLE RESSOURCES SONT VENDUE EN STOCK, ET DEVRA LES ACHETER OU RENDRE UN PETIT SERVICE
-> GroinMerlin

++ [Ruby Chon] COMMENCE A COMPARER LE GROIN MERLIN ET LE AUCHAMP SUR TOUT ET RIEN
-> GroinMerlin

++ [Mathéo Chon] VA ESSAYER DE LA DRAGER COMME A SON ABITUDE TOUT EN LA PREVENANT DE LA MENACE IMINANTE, FINIRA PAR VOUS CROIRE ET PATRTIRE SE REFUGIER
-> GroinMerlin

+ [Action 2] SE DEPLACE DANS LES LOCO 

++ [Pico Chon] 
-> GroinMerlin

++ [Ruby Chon]
-> GroinMerlin

++ [Mathéo Chon]
-> GroinMerlin

+ [Action 3] 

++ [Pico Chon]
-> GroinMerlin

++ [Ruby Chon]
-> GroinMerlin

++ [Mathéo Chon]
-> GroinMerlin

+ [Sortir]
-> ActionPrincipale

=== function ActivatePuzzle(active)
EXTERNAL ActivatePuzzle(active)