INCLUDE 2d_api.ink

VAR NBbouteillelancer = 0
VAR ColèreClodo = 0
VAR NNFrappe = 0
VAR ClodoKo = false
VAR Spray = false
VAR Materiaux = "Aucun"
VAR Argent = 0
VAR SavBoite = false


VAR PicoDehors = false
VAR connai_boite = false

VAR Lampe = false


//tabac=clochar tabacer, normale= clochard normale Pour les lieux regarde le chapitre "ActionChangeScene"

VAR SacCiment = false
VAR CacheSecret = false
VAR Bunker = false
VAR Cafeine = false
VAR CryptoMoney = false


VAR clochardstate = "normale"




//INTRODUCTION
~ fadeBg ("Maison", 0.5)
"Texte à l'introduction qui explique la situation"
-> ActionPrincipale


// Permet de savoir qui est où et était où ?
VAR pièceActuelle = "Maison"
VAR frere = "??????"
VAR last_visited = ""
VAR ChoixCocho = false

== return_to_last ==
{last_visited == "Interrieur": -> Interrieur}
{last_visited == "Cave": -> Cave}
{last_visited == "Antiquaire": -> Antiquaire}
{last_visited == "Clochard": -> Clochard}
{last_visited == "Ruine": -> Ruine}
{last_visited == "Puit": -> Puit}
{last_visited == "Mairie": -> Mairie}
{last_visited == "AuChamp": -> AuChamp}
{last_visited == "Restaurent": -> Restaurent}
{last_visited == "GroinMerlin": -> GroinMerlin}
{last_visited == "chapitre_1": }
{last_visited == "chapitre_2": }

== Quels_chon ==
~ChoixCocho = true
+ [Pico]
~frere = "Pico"
->return_to_last
+ [Ruby]
~frere = "Ruby"
->return_to_last
+ [Mathéo]
~frere = "Mathéo"
->return_to_last

=== ActionPrincipale===
+ [Ce déplacer] Déplacement ...
-> ActionChangeScene
+ {pièceActuelle == "Maison"} [Interrieur]
-> Interrieur
+ {pièceActuelle == "Maison"} [Cave]
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
+ {pièceActuelle == "Allée commerçantes"} [Restaurent]
-> Restaurent
+ {pièceActuelle == "Allée commerçantes"} [Groin Merlin]
-> GroinMerlin
//Zone principale

=== ActionChangeScene===
+ {pièceActuelle != "Maison"} [Maison] {~texte 1|texte 2|texte 3}
~ fadeBg ("Maison", 0.5)
~ pièceActuelle = "Maison"
~ last_visited = "Maison"
-> ActionPrincipale
+ {pièceActuelle != "Ruelle"} [Ruelle] {~texte 1|texte 2|texte 3}
~ fadeBg ("Ruelle", 0.5)
~ show ("clochardstate")
~ pièceActuelle = "Ruelle"
~ last_visited = "Ruelle"
-> ActionPrincipale
+ {pièceActuelle != "Place du village"} [Place du village] {~texte 1|texte 2|texte 3}
~ fadeBg ("Pvillage", 0.5)
~ pièceActuelle = "Place du village"
~ last_visited = "Place du village"
-> ActionPrincipale
+ {pièceActuelle != "Allée commerçantes"} [Allée commerçantes] {~texte 1|texte 2|texte 3}
~ fadeBg ("AlléeC", 0.5)
~ pièceActuelle = "Allée commerçantes"
~ last_visited = "Allée commerçantes"
-> ActionPrincipale


//Zone secondaire
// Maison //
== Interrieur ==
~ last_visited = "Interrieur"
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}
+ [Action 1] "texte, fouille et interagissent avec leur affaire perssonel"
++ [Pico Chon] "texte, doit montré que c'est un bon gars, alcoolique"
-> Interrieur

++ [Ruby Chon] "texte, doit montré que c'est une nerd plutôt cultivé"
-> Interrieur

++ [Mathéo Chon] "texte, doit montrer qu'il est musclé et stupide"
-> Interrieur

+ [Action 2]
++ [Pico Chon]
-> Interrieur

++ [Ruby Chon]
-> Interrieur

++ [Mathéo Chon]
-> Interrieur

+ [Action 3] 
++ [Pico Chon]
-> Interrieur

++ [Ruby Chon]
-> Interrieur

++ [Mathéo Chon]
-> Interrieur

+ [Sortir]
-> ActionPrincipale

== Cave ==
~ last_visited = "Cave"
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}
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

+ {Materiaux != "Aucun"} [Réparer le bunker] Vous appliquer "???" au bunker
~ Bunker = true
-> Cave

+ {Bunker == true} [Fermer le bunker] Vous fermer et attender la fin...
{Materiaux == "Aucun"}
-> END
{Materiaux == "Laine"}
-> END
{Materiaux == "PostCocho"} poster cochon
-> END
{Materiaux == "Rigolofleur"} fleur rigolodrole
-> END
{Materiaux == "Puzzle"}
-> END
{Materiaux == "Porte"}
-> END
{Materiaux == "Enceinte"} mur du son
-> END
{Materiaux == "CochoMobile"} cochonou mobile
-> END
{Materiaux == "OverTune"} trop d'argent
-> END
{Materiaux == "PatCroute"} Pâté en croute
-> END
{Materiaux == "PeauBete"}
-> END
{Materiaux == "Porkia33000"} Ok
-> END
{Materiaux == "Ciment"}
-> END
{Materiaux == "Gelée"}
-> END
{Materiaux == "SourceOG"} Matériaux du compte (Trois petit cochon)
-> END
{Materiaux == "Porcium"}
-> END

+ [Sortir]
-> ActionPrincipale

+ [Sortir]
-> ActionPrincipale

// Ruelle //
== Antiquaire ==
Antiquaire : Bienvenue dans mon antre, les petits cochons... 
Antiquaire : Que venez-vous chercher dans ce capharnaüm de trésors oubliés ?
-> entree

= entree
+ [Parler]
    ++ [Pico] { PicoDehors == false }
        Pico : Tu vends des objets magiques ? J’ai besoin de ma dose.
        Antiquaire : Hmm… Magique ? Pas vraiment… Mais j’ai cette magnifique chenille en or ! Parfaite pour les amateurs d’originalité...
        Pico : Non, non. J’veux ma *dose*, pas un gadget pour vieux collectionneur !
        Antiquaire : Si tu cherches du bizarre, j’ai peut-être entendu parler d’une vieille lampe abandonnée dans les ruines. Elle aurait un petit air magique.
        -> entree

    ++ [Ruby]
        Ruby : Je cherche du matos électronique, t’as ça ?
        Antiquaire : Tu crois être chez Darty ici ? Je ne vends que du matériel noble, de l’authentique, de l’unique !
        Ruby : Noble ? T’appelles ça noble ? C’est de la camelote ton bric-à-brac… même pas un pet de circuit imprimé dans tout le magasin.
        Antiquaire : Comment ?! Tu insultes ma boutique ?
        Ruby : Ton "matériel noble", c’est juste un tas de vieux trucs bons pour le grenier de mémé.
        -> entree

    ++ [Mathéo]
        Mathéo : Vous avez des objets vraiment précieux ici ?
        Antiquaire : J’ai de tout : bijoux anciens, meubles rares, objets d’époque… Malheureusement, l’un des plus beaux m’a été volé.
        Mathéo : Dis-moi qui l’a volé, je vais lui refaire le portrait.
        Antiquaire : Calme-toi. C’est mon frère. Il squatte devant la boutique et refuse de me rendre ce qu’il m’a pris.
        -> entree

+ [Voler]
    ++ [Pico] { PicoDehors == false }
        Pico (pensée) : Bon... j’vais m’faire discret et choper un truc intéressant.
        Pico mit la main sur un lustre vénitien en or massif, mais le fit tomber comme un manche.
        Antiquaire : TOUCHE PAS À ÇA !!!
        Pico fut jeté dehors à coups de pied dans le gras.
        ~ PicoDehors = true
        -> entree

    ++ [Ruby]
        Ruby (pensée) : Voyons s’il a planqué un vieil ordi ou une puce quelque part...
        Ruby fouilla méthodiquement. Résultat ? Rien. Nada. Même pas un câble USB.
        Ruby : Tout ce matos est dépassé ! Ce gars vit dans une autre époque, il pige rien à la vraie tech...
        -> entree

    ** [Mathéo] { Materiaux == "" }
        Mathéo (pensée) : C’est quoi ça, une pelote de laine ? Ça peut toujours servir...
        Mathéo attrapa la pelote et la glissa dans son sac en sifflotant.
        ~ Materiaux = "Laine"
        -> entree
        
+ [Parler de la boîte] { connai_boite == true }
    ++ [Pico] { PicoDehors == false }
        Pico : J’ai entendu parler d’une boîte... Tu saurais où elle est ? J’veux la fumer, ou un truc du genre.
        Antiquaire : La boîte à musique ? Ouais. Elle est avec mon frère, le type dans la ruelle. Va le voir, mais vas-y mollo, il est déjà assez fêlé.
        -> entree

    ++ [Ruby]
        Ruby : Dis, la boîte là ! Tu sais, la boîte ! En bois ! Genre chaudron, mais avec des trucs en fer dessus… Tu vois ?
        Antiquaire : Ah, celle-là ? Tu parles beaucoup… mais t’as une bonne tête. Elle est à mon frère, dans la ruelle.
        Antiquaire : Tiens, prends ça. *(Il lui tend une petite liasse.)*
        ~ Argent += 1
        Antiquaire (pensée) : Bon débarras. Elle m’aurait tenu la jambe pendant une heure sinon...
        -> entree

    ++ [Mathéo]
        Mathéo : Écoute ma jolie, j’en ai marre de chercher cette boîte. Tu sais où elle est ou pas ?
        Antiquaire : Aucune idée, mon chou. Mais regarde cette tondeuse Cochonou de collection ! En saphir massif ! Promo du siècle !
        -> entree

+ [Sortir]
Antiquaire : Au plaisire de vous revoir !
-> ActionPrincipale

== Clochard ==
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}

+[Discussion] // Discuter/acheter avec le clochard
++ [Pico Chon] // +1 : donne la boîte (de vrai bro)
{->ParleCloclo1|->ParleCloclo2|->ParleCloclo3|->ParleCloclo4}

++ [Ruby Chon]
{ClodoKo == false:
    {Cafeine == false: // Vous tentez une approche, mais sans succès...
    Ruby: Pourquoi {~j’irai lui parler ?|faire ?|insister ?}
    Ruby: Il ne comprendrait pas la moitié de ce que je lui dis.
    Ruby: {~En plus, je n’ai pas assez d’énergie pour ça...|Peut-être qu’avec un café...|Pfff, j’ai besoin d’un remontant...}
    -> Clochard
    }
    {Spray == false:
        {Cafeine == true: // Vous lui apprenez la crypto money ...
        {CryptoMoney == false:
        Ruby: Tu sais que t’as le prérequis pour monter ton empire, là ?
        Clochard: Tu penses parler à qui au juste ?
        Ruby: Je parle de toi.
        Ruby: Avec ce que tu sais faire, tu pourrais vivre de la crypto.
        Clochard: J’ai déjà vécu du yaourt périmé pendant six jours…
        Clochard: On m’impressionne plus avec des mots grecs.
        Ruby: C’est pas grec, c’est numérique.
        Ruby: V I R T U E L …
        Ruby: C’est de l’argent, mais sans pièces, ni billets.
        Clochard: Donc c’est comme les promesses de Bernard, le boulanger.
        Ruby: Non !
        Ruby: C’est fiable, et on appelle ça de la blockchain.
        Clochard: Des chaînes de vélo ?
        Ruby: Pas ce genre de chaîne !
        Ruby: C’est un registre décentralisé.
        Clochard: La seule décentralisation que j’ai connue, c’est quand j’ai dormi entre deux bancs près du parc.
        Ruby: Bon, regarde…
        Ruby: Là, j’ai investi dans une pièce qui s’appelle Pigcoin.
        Clochard: Ouais…
        Clochard : Et ça sert à quoi, ton “Pig-coin” ?
        Ruby : À faire des transactions, acheter, vendre, investir…
        Clochard: Moi j’échange un briquet vide contre une soupe.
        Clochard: T’appelles pas ça une transaction peut-être ?
        Ruby: T’as pas tort, mais c’est là que j’y viens…
        Ruby: Imagine utiliser tes talents de vendeur comme tu le fais à une échelle mondiale.
        Clochard: J’ai même pas de brosse à dents.
        Clochard: Et tu veux que je gère une économie planétaire ?
        Ruby: Si t’as un vieux téléphone, tu peux déjà commencer.
        Clochard : J’en ai un qui vibre sans prévenir…
        Ruby: Ça fera l’affaire…
        Ruby: On va t’ouvrir un portefeuille virtuel.
        Ruby: Et ensuite…
        ~ CryptoMoney = true
        }

        {CryptoMoney == true:
        Ruby: {Alors, ça mine ?|Les blockchain se portent bien ?|T’as besoin de conseil ?}
        Clochard: Ouais, ouais...
        Clochard: {Là, je suis en train de manipuler le commerce...|T’as déjà vu mon dernier NFT "Garbage", il fait un "carton". (littéralement !)|Pas besoin, je suis dans le flux...}
        }
    }
}
    {Spray == true:
    Clochard: {Je veux plus te voir !|Casse-toi !|T’approche pas !}
    }
}
{ClodoKo == true:
Ruby: {~(Il ne risque pas de dire grand-chose...)|(Il est inconscient...)|(Inconsciemment, je me dis que c’est une bonne chose...)}
}
-> Clochard

++ [Mathéo Chon] // se fait insulter par le clochard
{->ParleMath1|->ParleMath2|->ParleMath3|->ParleMath4|->ParleMath5}

+[Attaquer]
++ [Pico Chon] // -1 : il est bourré il lance les bouteilles mais rate comme une merde
// Lance une bouteille, elle casse à côté, bruit de verre cassé
~NBbouteillelancer += 1
{ClodoKo == false:
    {NBbouteillelancer == 1:
    Clochard: T’as essayé de faire quoi là ?
    Pico: D’te donner à boire...
    Clochard: Ho ...
    Clochard: Tu n’étoiras tes cochonneries après hein ?
    Pico: ...
    Clochard: ...
    }
    {NBbouteillelancer >= 2:
    Clochard:{~Tu comptes en lancer encore combien ?|Tu vas me laisser nettoyer à chaque fois ?|Et de {NBbouteillelancer}, tu les sors d’où toutes ces bouteilles ?}
    Pico:{?|??|???}
    }
}
{ClodoKo == true:
    Pico:{?|??|???}
}
-> Clochard

++ [Ruby Chon] // 0 : utilise un spray anti-ours sur le clochard
{Spray == false:
Clochard: Eh bien…
Clochard: Que me vaut cette approche ?
Clochard: Tu veux que je te cagole ma ...?
Ruby: HAAAA M’APPROCHE PAS !
// Coup de spray à Ours pendant 1 min
Clochard: HAAAA !!!
Clochard: Sale petite ***** de ****** !
Clochard: ***** *** ** **** ******* **** !
Ruby:
~Spray = true
- else:
Ruby: Je ne m’approche plus de ce type à moins d’un mètre !
}
-> Clochard

++ [Mathéo Chon] // +1 : lui met un mach punch stabbé à x2 atk dans sa tête
-> MathAttaqueClo

+[Acheter]
-> ClochardBoutique

+[Partir]
clochard: À un de ses quatre !
-> ActionPrincipale

== ClochardBoutique ==
Présentation de son commerce froduleux

[Porkia 33000]
++ [Questionné]
Clochard: Ha ha, je vois que vous avez du groin, Mrs !
Clochard: Cette petite merveille se trouve être un ancien modèle de téléphone très recherché…
Clochard: Son design peut paraître grossier au premier abord, mais je vous garantis que la qualité de ce produit réside ailleurs…
Clochard: Car oui !
Clochard: Plus que pour appeler vos proches, vous pouvez casser des noix avec !
Clochard: DES NOIX !
Clochard: (Voir bien plus d'ailleurs…)
Clochard: Alors ?
Clochard: On fait affaire ?
-> ClochardBoutique
++ [Achat]
~Materiaux = "Porkia33000"
-> ClochardBoutique
++ [Troque]

-> ClochardBoutique
++ [Reposer l'objet]
Clochard: {~Dommage...|Pas à votre goût ?|P’t’être une prochaine fois !}
Clochard: Si vous changez d’avis...
-> ClochardBoutique

+ [C4]
++[Questioné]
Clochard: Ou là!
Clochard: Faite attention avec ce pain…
Mathéo: Du pain?
Mathéo: Il n’est pas très appétissant…
Clochard: Rassurez moi, il n’est pas toujours comme ça…
???: 
???: 
Clochard: Si ?
Clochard: Enfin peu m'importe, cette merveille tout droit sortie de nos frontières, pourrait vous démolir un charre d'assaut, ou bien labourer une parcelle en un temps record !
Clochard: Je vous préviens, je ne suis en aucun cas fautive de vos agissements en ce qui concerne son utilisation !
Clochard: Vous prenez quand même ?
-> ClochardBoutique

++[Achat]

-> ClochardBoutique

++[Troque]

-> ClochardBoutique

++[Reposer l'objet]
Clochard: {~Domage...|Pas à votre goût ?|P't'être une prochaine fois !}
Clochard: Si vous changer d'avis...
-> ClochardBoutique

+ [Chateau la pompe du XVIIème]
{->BouteilDeClo1|->BouteilDeClo2|->BouteilDeClo3|->BouteilDeClo4|->BouteilDeClo5}

+ [Boîte à musique]
++[Questioné]
Clochard: Une très belle pièce, je vous le dit !
Clochard: Je ne saurais pas plus vous informer sur son origine…
Clochard: Mais je croie que sa vient du Perault.
Clochard: C’est une bonne affaire !
-> ClochardBoutique

++[Achat]

-> ClochardBoutique

++[Troque]
Clochard: Pourquoi pas...
{Lampe == true:
Clochard: Je vois que vous aver une très belle lampe !
Clochard: Si vous acceptiez de vous en séparer je...
LeGroupe: Oui !
Clochard: Marché conclue !
-> ClochardBoutique
-else:
Clochard: Par contre je ne voie rien de valeur dans se que vous transporter...
Clochard: Revener me voir si vous trouver quelque chose d'intéressant.
-> ClochardBoutique
}

++[Reposer l'objet]
Clochard: {~Domage...|Pas à votre goût ?|P't'être une prochaine fois !}
Clochard: Si vous changer d'avis...
-> ClochardBoutique

+ [Vous désister]
Clochard: Aucun problème!
Clochard: Je serais toujours ouvert.
-> Clochard

==BouteilDeClo1
Clochard: Cette bouteille ?
Clochard: Désolé, pas à vendre…
Clochard: C’est pour ma consommation personnelle, hé hé…
-> Clochard

==BouteilDeClo2
Clochard: Puisque je vous dis qu’elle est pour moi !
Clochard: C’est si dur à comprendre ?
-> Clochard

==BouteilDeClo3
Clochard: Ok c’est bon…
Clochard: Si vous la voulez tant que ça, va falloir y mettre le prix !
Clochard: Cette bouteille est un précieux millésime que j’ai chour.!.
Clochard: Qui m'a gracieusement été offert par Etchebacon, après lui avoir rendu un très gros service…
Clochard: Alors ?
Clochard: Tu veux toujours l’acheter ?
+[Achat]

-> ClochardBoutique

*[Troque]
Clochard: Non, je ne le troquerait pour rien au monde... (sauf de l'espèce)
-> BouteilDeClo3

+ [Reposer l'objet]
Clochard: Non ?
Clochard: Alors évite de me déranger pour rien...
-> ClochardBoutique

==BouteilDeClo4
Clochard: NON MAIS SÉRIEUX ***** !
Clochard: VOUS AVEZ PAS FINI DE ME FAIR ***** !
Clochard: ACHETER LE QU’ON EN FINISSENT !
+[Achat]

-> ClochardBoutique

*[Troque]
Clochard: JE NE TROQUERAIT RIEN CONTRE !
-> BouteilDeClo4

+ [Reposer l'objet]
Clochard: TU TE DECIDE OUI OU ****** !
-> ClochardBoutique

==BouteilDeClo5
Clochard: ******* DE ******, FINI A LA ****** !
Clochard: ****** *** *** *** *** ****** **** !
Clochard: (Bois la bouteil cul sec)
Clochard: Aher du brais nsgz le kalin ?
Clochard: HEINNNNN !
Clochard: ****** …
// Le clochard s'écroule bouré comme un coin…
Mathéo: 
Ruby: 
Pico: 
-> Clochard

==ParleCloclo1
Pico: T’étais où ce matin ?
Pico: J’t’ai cherché derrière le AuChamp, personne…
Clochard: Trop de passage ce matin.
Clochard: Ici, au moins, j’entends mes pensées.
Pico: Moi, j’ai failli bosser ce matin
Clochard: Toi ?
Pico : Une meuf m’a proposé de l’aide pour un déménagement.
Pico : J’ai dit ouais.
Clochard : Et ?
Pico : Bah j’suis tombé dans ses escaliers avant d’arriver.
Clochard: C’est le destin qui t’a sauvé.
Pico : Ouais… (ou mes lacets.)
Clochard: Moi, j’ai eu une illumination aujourd’hui.
Pico : Dis-moi ?
Clochard : J’ai pensé monter un business de parapluies transparents pour chats d’appartement.
Pico : Attends… quoi ?
Clochard : “Ils ne sortent pas, mais faut les habituer au style de vie.”
Pico: Mais mec… 
Pico: Pourquoi t’es pas millionnaire ?
Clochard : Parce que j’connaissais personne qui avait un chat et un compte en banque.
Pico: T’es trop en avance sur ton temps.
Clochard : Me fait pas rire.
-> Clochard

==ParleCloclo2
Pico: Dit, c’est nouveau ça ?
Clochard : Tu parles de cette boîte à musique ?
Pico : Elle fonctionne ?
Clochard: Pas du tout…
Pico: Tu l’as depuis quand ?
Clochard: Deux jours.
Clochard: Je l’ai trouvée coincée derrière un vieux paravent, près de l'arrière cours d’chez l’antiquaire…
Pico: Comme toi, un peu.
Clochard: Ha ha ha !
Clochard: Elle est bien bonne!
Clochard : Allez tiens.
Pico: Hein ?
Clochard : Prends-la.
Clochard: De toute façon je ne pourrais surement pas la vendre en l’état… (en plus c’est du toc)
Pico: Merci bro!
Clochard: Et si quelqu’un demande d’où elle vient… tu dis que tu l’as trouvée.
-> Clochard

==ParleCloclo3
Pico: T’as eu d’autres trésors comme ça ?
Clochard: J’ai eu une horloge, un jour.
Clochard: Très belle.
Pico: Elle marchait ?
Clochard: Elle courait même!
Mathéo: Sérieux !?!
Clochard: Non…
Clochard: Elle n'avait pas d’aiguilles, mais j’la vendais comme “conceptuelle”.
Pico: T’es un artiste, en fait.
Clochard: Disons que je pourrais te vendre du sable en plein désert !
-> Clochard

==ParleCloclo4
Pico: Un vrai receleur…
Clochard: Tu l'a dit !
Clochard: N’hésite pas à me dire si quelque chose te tape à l'œil…
-> ClochardBoutique

==ParleMath1
Mathéo: Tiens ?
Mathéo: La municipalité n'a pas encore jeté les ordures ?
Clochard: J’ai pas plus bougé que tes deux neurones depuis la maternelle fiston...
Mathéo: Ah ouais !
Mathéo: Hé bien, les poubelles du coin on de la réparti à ce que je voie.
~ColèreClodo += 1
-> Clochard

==ParleMath2
Clochard: Toujours avec ta coupe de cheveux de patron de salle de sport fictive.
Mathéo: J’plais à tout le monde.
Mathéo: Moi !.
Clochard: Tu plais surtout à ton miroir.
Clochard: Et encore, il doit craquer sous la pression.
~ColèreClodo += 1
-> Clochard

==ParleMath3
Mathéo: Tu veux un selfie ou un autographe ?
Clochard: Je veux un miracle !
Clochard: Genre, une minute sans t’entendre !
Mathéo: Je suis ce que t’auras jamais.
Clochard: Ouais… Une tête vide !
Clochard: Avec une merde dessus.
Clochard: !?! …
~ColèreClodo += 1
-> Clochard

==ParleMath4
Mathéo: T’es juste aigri parce que j’ai tout ce que t’as pas.
Clochard: Ouais, t’as raison.
Clochard: J’ai pas ton QI de frigo débranché…
Mathéo: Tu dis ça parce que t’as jamais été à mon niveau.
Clochard: Ton niveau ?
Clochard: IL EST À LA HAUTEUR DU TROTTOIRE TON NIVEAUX !
Clochard: C’EST P'T’ÊTRE POUR ÇA QUE JE TE VOIS SOUVENT !
Mathéo: RETOURNE MANGER DES POUBELLES TOI !
~ColèreClodo += 1
-> Clochard

==ParleMath5
Clochard: TU ME CHERCHE C’EST CA !?!
Clochard: TU ME CHERCHE !?!
Mathéo: OUI !
Clochard: VA Y J’T’ATTEND !
~ColèreClodo += 1
-> MathAttaqueClo

==MathAttaqueClo
{ClodoKo == false:
    {ColèreClodo <= 5:
    Clochard: T’approche pas…
    Clochard: T'APROCHE PAS J’AI DIT !
    Mathéo: Il est grand temps de jeter les ordures !
    - else:
    Clochard: VAS Y !
    Clochard: APPROCHE MON COCHON !
    Mathéo: PAS BESOIN DE ME LE DIRE DEUX FOI! 
    // Mise à tabac
    ~clochardstate = "tabac"
    }
    {ClodoKo == false:
    Clochard: Ghhe, pftu bra’le payer fther…
    Clochard: ***** !
    // S'écroule inconscient
    Mathéo: 
    ~ClodoKo = true
    }
}
{ClodoKo == true:
// Frappe un coup
Mathéo:{Il à déjà eu son compte…|Bon, juste un coup de pied…|C’est drôle en fait !|Un pour Pico…|Un pour Ruby…|Un pour Moi…|Un pour la voisine…|Un pour le chien de la voisine}
    ~NNFrappe += 1
    {NNFrappe >= 10:
    //Au bout de la ??ème fois
    Mathéo: Un pour...
    Pico : C'est bon, STOP!
    Pico : {A force il va devenir bleu !|C'est pas un sac de frappe !|La bombe finira le travaille...}
    Ruby : Apprès, il l'avait un peux chercher...
    }
}
-> Clochard

== Ruine ==




+ [Sortir]
-> ActionPrincipale

//Place du village//
== Puit ==
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}
+ [Action 1]
++ [Pico Chon]
-> Puit

++ [Ruby Chon]
-> Puit

++ [Mathéo Chon]
-> Puit

+ [Action 2]
++ [Pico Chon]
-> Puit

++ [Ruby Chon]
-> Puit

++ [Mathéo Chon]
-> Puit

+ [Action 3]
++ [Pico Chon]
-> Puit

++ [Ruby Chon]
-> Puit

++ [Mathéo Chon]
-> Puit

+ [Sortir]
-> ActionPrincipale

== Mairie ==
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}
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

+ [Discuter] Discute avec PNJ 7
++ [Pico Chon]
-> Mairie

++ [Ruby Chon]
-> Mairie

++ [Mathéo Chon]
-> Mairie

+ [Sortir]
-> ActionPrincipale

== Marché ==
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}
+ [Fouillé] Vous fouiller les ruine
++ [Pico Chon]
-> Marché

++ [Ruby Chon]
-> Marché

++ [Mathéo Chon]
-> Marché

+ [Action 2]
++ [Pico Chon]
-> Marché

++ [Ruby Chon]
-> Marché

++ [Mathéo Chon]
-> Marché

+ [Action 3]
++ [Pico Chon]
-> Marché

++ [Ruby Chon]
-> Marché

++ [Mathéo Chon]
-> Marché

+ [Sortir]
-> ActionPrincipale

//Allée commercante//
== AuChamp ==
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}
+ [Action 1]
++ [Pico Chon]
-> AuChamp

++ [Ruby Chon]
-> AuChamp

++ [Mathéo Chon]
-> AuChamp

+ [Discuter] Discute avec PNJ 1
++ [Pico Chon]
-> AuChamp

++ [Ruby Chon]
-> AuChamp

++ [Mathéo Chon]
-> AuChamp

+ [Action 3]
++ [Pico Chon]
-> AuChamp

++ [Ruby Chon]
-> AuChamp

++ [Mathéo Chon]
-> AuChamp

+ [Sortir]
-> ActionPrincipale

== Restaurent ==
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}
+ [Parler]
    ++ [Pico]
    Chef: Bonjour mon grand !
    Chef: Qu’est-ce qui t'amène ici, tu viens parler cuisine avec moi ?
    Pico: Parler cuisine ?
    Pico: J’adore cuisiner et boire moi ! 
    Pico: Surtout boire !
    Chef: Super alors ! 
    Chef: Ça te dirait de cuisiner avec moi ?
    Pico: J’ai trop faim, je veux bien !
    Chef: Très bien alors ! 
    Chef: C’est une recette un peu expérimentale à base de gelée, jamais essayé, mais ça va faire un carton dans mon restaurant !
    Pico: Y aura de l’alcool dedans ?
    Chef: J’en sais rien, on verra !
    // CUISINE TIME !
    Chef: Et voilà le travail !
    Chef: Qu'en penses-tu ?
    Pico: C’est... gluant. Sans vrai goût, et encore moins d’alcool !
    Chef: Vraiment ? Bon... j’en referai pas. Mais au moins, j’aurai essayé !
    Pico: Et le reste de gelée ?
    Chef: Tu sais quoi ?
    Chef:Je te le donne.
    Chef:Ça me sert plus à rien !
    Pico: Merci Chef !
    ~ Materiaux = "Gelée"
    -> Restaurent
 /*   ++ [Ruby]
        {TravailRubyFait == true:
            -> ParleChefRuby2
        - else:
            -> ParleChefRuby
        }
    ++ [Mathéo]
        -> ParleChefMatheo

+ [Commander à boire]
    ++ [Pico]
        -> CommandeBoissonPico
    ++ [Ruby]
        -> CommandeBoissonRuby
    ++ [Mathéo]
        -> CommandeBoissonMatheo

+ [Rendre service]
    ++ [Pico]
        -> TravailPico
    ++ [Ruby]
        -> TravailRuby
    ++ [Mathéo]
        -> TravailMatheo
*/

== GroinMerlin ==
"Texte d'introduction au lieu" {~texte 1|texte 2|texte 3}
+ [Discuter] Discute avec PNJ 3
++ [Pico Chon]
-> GroinMerlin

++ [Ruby Chon]
-> GroinMerlin

++ [Mathéo Chon]
-> GroinMerlin

+ [Action 2]
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

//  Tableau des Discution
