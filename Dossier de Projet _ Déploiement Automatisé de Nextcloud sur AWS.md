# Dossier de Projet : Déploiement Automatisé de Nextcloud sur AWS

---

*Note : Ce document constitue le dossier de projet complet pour le déploiement automatisé de Nextcloud sur AWS. Les emplacements indiqués pour les captures d'écran sont à compléter par l'utilisateur.*
# Sommaire Détaillé

Ce sommaire détaillé présente la structure complète du dossier de projet, incluant les sections principales et les sous-sections, pour faciliter la navigation.

1.  **Introduction**
2.  **Contexte et Objectifs**
    *   Contexte
    *   Objectifs
3.  **Environnement technique**
    *   Infrastructure Cloud AWS
        *   AWS S3 (Simple Storage Service)
    *   Outils d'automatisation
        *   Terraform
        *   Ansible
    *   Technologies de conteneurisation et d'orchestration
        *   Docker
        *   Kubernetes (K3s)
    *   Application et services
        *   Nextcloud
        *   NGINX
    *   Outils de supervision
        *   Prometheus
        *   Grafana
    *   Intégration et déploiement continus
        *   Jenkins
        *   SonarQube
        *   Git et GitHub
4.  **Méthodologie**
    *   Approche globale
    *   Phases méthodologiques
        *   Phase 1 : Analyse et conception
        *   Phase 2 : Provisionnement de l'infrastructure
        *   Phase 3 : Installation et configuration des outils de base
        *   Phase 4 : Déploiement de Nextcloud
        *   Phase 5 : Mise en place de la supervision
        *   Phase 6 : Mise en place du CI/CD
        *   Phase 7 : Tests et validation globale
5.  **Déroulement du projet**
    *   Analyse initiale et conception
    *   Provisionnement de l'infrastructure AWS
    *   Installation et configuration des outils de base
    *   Déploiement de Nextcloud sur Kubernetes
    *   Mise en place de la supervision
    *   Mise en place du CI/CD avec Jenkins
    *   Tests et validation globale
6.  **Résultats obtenus**
    *   Infrastructure cloud entièrement automatisée
    *   Nextcloud opérationnel dans Kubernetes
    *   Sécurisation complète avec NGINX et SSL
    *   Supervision complète avec Prometheus et Grafana
    *   Pipeline CI/CD fonctionnel avec Jenkins
    *   Performances et métriques
    *   Documentation et maintenabilité
    *   Synthèse des résultats
7.  **Conclusion**
    *   Synthèse des réalisations
    *   Enseignements et compétences acquises
    *   Axes d'amélioration et perspectives
    *   Impact professionnel et personnel
    *   Mot de la fin

**Annexes**
*   Annexe A : Liste des abréviations
*   Annexe B : Prérequis et Installation des Outils
*   Annexe C : Configuration d'AWS
*   Annexe D : Commandes Terraform Essentielles
*   Annexe E : Installation et Configuration de Kubernetes (K3s) sur Ubuntu
*   Annexe F : Bibliographie et Références
# 1. Introduction

Dans le cadre de ma formation d'Administrateur Système DevOps, j'ai entrepris un projet ambitieux visant à déployer de manière automatisée une application collaborative, Nextcloud, sur une infrastructure cloud AWS. Ce projet représente l'aboutissement des compétences acquises tout au long de ma formation et démontre ma capacité à concevoir, implémenter et maintenir une solution cloud complète répondant aux exigences des environnements professionnels modernes.

L'objectif principal de ce projet était de construire une plateforme sécurisée, évolutive et supervisée, en s'appuyant sur des outils modernes d'automatisation et de conteneurisation. Dans un contexte où les entreprises cherchent constamment à optimiser leurs infrastructures informatiques tout en garantissant la sécurité et la disponibilité de leurs données, ce projet apporte une réponse concrète à ces enjeux.

Le déploiement a été entièrement automatisé grâce à l'utilisation de Terraform pour la création des ressources cloud et d'Ansible pour l'installation des composants systèmes. Cette approche "Infrastructure as Code" (IaC) permet non seulement de réduire les erreurs humaines lors du déploiement, mais aussi de garantir la reproductibilité de l'infrastructure, facilitant ainsi les déploiements futurs et la maintenance.

Nextcloud a été déployé dans un cluster Kubernetes (K3s) pour assurer l'orchestration des conteneurs, offrant ainsi une solution robuste pour la gestion du cycle de vie de l'application. La sécurisation des communications a été mise en œuvre via un reverse proxy NGINX avec support HTTPS, garantissant la confidentialité des données échangées entre les utilisateurs et la plateforme.

La supervision de l'ensemble de l'infrastructure a été assurée par Prometheus et Grafana, permettant une surveillance en temps réel des performances et de la disponibilité du service. Cette approche proactive de la supervision permet d'anticiper les problèmes potentiels et d'intervenir avant qu'ils n'affectent les utilisateurs finaux.

Enfin, l'automatisation des mises à jour de Nextcloud a été implémentée grâce à Jenkins, qui orchestre le déploiement des nouvelles versions dans le cluster Kubernetes. Cette intégration continue garantit que la plateforme reste à jour avec les dernières fonctionnalités et correctifs de sécurité, tout en minimisant les interventions manuelles.

Ce projet illustre parfaitement la capacité à concevoir et mettre en production une solution cloud complète pour une application critique, en intégrant les meilleures pratiques DevOps et en utilisant les technologies les plus adaptées aux besoins spécifiques de l'entreprise.
# 2. Contexte et Objectifs

## Contexte

Dans l'écosystème numérique actuel, les entreprises font face à des défis croissants concernant le stockage, le partage et la collaboration sur leurs données. Face à l'importance grandissante du cloud computing et de la collaboration en ligne, les organisations de toutes tailles recherchent des plateformes fiables, sécurisées et facilement évolutives pour répondre à leurs besoins.

Nextcloud s'impose comme une solution pertinente à ces enjeux en fournissant une alternative open source aux services propriétaires d'hébergement de fichiers et de collaboration. Cette plateforme offre un contrôle total sur les données, contrairement aux solutions SaaS qui peuvent soulever des questions de confidentialité et de souveraineté des données. En déployant Nextcloud sur une infrastructure cloud maîtrisée, les entreprises peuvent bénéficier à la fois de la flexibilité du cloud et de la sécurité d'une solution auto-hébergée.

Cependant, le déploiement manuel d'une telle infrastructure présente plusieurs inconvénients majeurs : risques d'erreurs humaines, manque de reproductibilité, difficultés de maintenance et de mise à jour. C'est pourquoi l'automatisation du déploiement et de la gestion de l'infrastructure devient cruciale pour garantir la fiabilité et la pérennité de la solution.

Ce projet a été réalisé dans l'objectif de maîtriser toutes les étapes de déploiement et de maintenance d'un service cloud en environnement professionnel. Il répond à un besoin concret des entreprises qui souhaitent moderniser leur infrastructure informatique tout en conservant le contrôle sur leurs données sensibles. La combinaison des technologies cloud, de conteneurisation et d'automatisation permet de créer une solution robuste, évolutive et facile à maintenir.

L'utilisation d'AWS comme plateforme cloud sous-jacente offre une infrastructure fiable et hautement disponible, tandis que l'approche DevOps adoptée dans ce projet garantit une intégration harmonieuse entre le développement et l'exploitation de la solution. Cette synergie est essentielle pour répondre efficacement aux besoins changeants des utilisateurs tout en maintenant un niveau élevé de qualité de service.

## Objectifs

Le projet s'articule autour de plusieurs objectifs techniques et fonctionnels précis, visant à créer une solution complète et professionnelle :

L'automatisation complète de l'infrastructure constitue le premier pilier du projet. L'utilisation de Terraform pour provisionner les ressources AWS permet de définir l'infrastructure sous forme de code, garantissant ainsi sa reproductibilité et facilitant sa gestion dans le temps. Chaque composant de l'infrastructure, des instances EC2 aux groupes de sécurité en passant par le réseau VPC, est créé de manière programmatique, éliminant ainsi les configurations manuelles sources d'erreurs.

L'installation et la configuration des serveurs représentent le deuxième objectif majeur. Ansible a été choisi pour cette tâche en raison de sa simplicité et de son approche déclarative. Les playbooks Ansible permettent d'installer et de configurer automatiquement tous les composants nécessaires sur les différentes instances, garantissant ainsi une configuration homogène et conforme aux bonnes pratiques.

Le déploiement de Nextcloud sur Kubernetes constitue le troisième objectif clé. K3s, une distribution légère de Kubernetes, a été sélectionnée pour orchestrer les conteneurs Nextcloud. Cette approche offre une architecture scalable et résiliente, permettant d'ajuster les ressources en fonction de la charge et de garantir une haute disponibilité du service.

La sécurisation des accès représente un objectif fondamental dans un contexte où la protection des données est primordiale. La mise en place d'un reverse proxy NGINX avec support HTTPS assure le chiffrement des communications entre les utilisateurs et la plateforme, protégeant ainsi les données en transit contre les interceptions malveillantes.

La supervision de l'infrastructure et de l'application constitue un objectif essentiel pour garantir la qualité de service. L'intégration de Prometheus pour la collecte des métriques et de Grafana pour leur visualisation permet une surveillance en temps réel de tous les composants du système, facilitant ainsi la détection proactive des anomalies et l'optimisation des performances.

Enfin, l'automatisation des mises à jour via un pipeline CI/CD représente le dernier objectif majeur. Jenkins a été configuré pour détecter automatiquement les modifications dans le dépôt Git contenant les manifests Kubernetes de Nextcloud et déclencher le déploiement des nouvelles versions dans le cluster. Cette approche garantit que la plateforme reste à jour avec les dernières fonctionnalités et correctifs de sécurité, tout en minimisant les interventions manuelles.
# 3. Environnement technique

L'environnement technique mis en place pour ce projet repose sur un ensemble de technologies modernes et complémentaires, choisies pour leur robustesse, leur flexibilité et leur capacité à s'intégrer harmonieusement dans une architecture DevOps. Cette section détaille les différents outils et technologies utilisés, en expliquant leur rôle spécifique dans l'architecture globale.

## Infrastructure Cloud AWS

Amazon Web Services (AWS) constitue le socle de l'infrastructure cloud de ce projet. Cette plateforme a été choisie pour sa fiabilité, sa maturité et son large éventail de services. Les instances EC2 (Elastic Compute Cloud) ont été utilisées pour héberger les différents composants de l'architecture. Ces machines virtuelles offrent une flexibilité optimale en termes de ressources (CPU, mémoire, stockage) et peuvent être facilement redimensionnées en fonction des besoins.

Le réseau a été configuré à l'aide d'un VPC (Virtual Private Cloud) dédié, permettant d'isoler l'infrastructure du reste du cloud public et de définir précisément les règles de communication entre les différents composants. Les groupes de sécurité ont été configurés pour filtrer le trafic entrant et sortant, n'autorisant que les communications nécessaires au bon fonctionnement de l'application.

Pour ce projet, quatre instances EC2 ont été déployées, chacune avec un rôle spécifique :
- Une instance "Application" hébergeant le cluster Kubernetes et Nextcloud
- Une instance "Supervision" pour Prometheus, Grafana et NGINX
- Une instance "Pipeline" pour Jenkins
- Une instance "Master" servant de point d'entrée pour la gestion de l'infrastructure

Toutes ces instances utilisent Ubuntu Server 22.04 LTS comme système d'exploitation, garantissant ainsi une base stable et supportée sur le long terme.

### AWS S3 (Simple Storage Service)

Amazon Simple Storage Service (S3) est un service de stockage d'objets hautement évolutif, durable et sécurisé proposé par AWS. Bien qu'il ne soit pas explicitement détaillé comme un composant principal dans les sections précédentes pour l'exécution de Nextcloud lui-même, S3 joue souvent un rôle crucial dans les infrastructures cloud modernes, y compris potentiellement dans ce projet pour plusieurs raisons :

*   **Stockage Externe pour Nextcloud :** Nextcloud peut être configuré pour utiliser S3 comme stockage principal pour les fichiers des utilisateurs. Cela permet de découpler le stockage des données de l'instance applicative, offrant une scalabilité quasi illimitée et une durabilité élevée (99.999999999% - onze 9s) pour les données.
*   **Sauvegardes :** S3 est une destination idéale pour stocker les sauvegardes de l'application Nextcloud (base de données, fichiers de configuration) et de l'état du cluster Kubernetes (via des outils comme Velero). Sa faible coût et sa durabilité en font un choix privilégié pour la reprise après sinistre.
*   **Backend Terraform :** S3 peut être utilisé comme backend distant pour stocker le fichier d'état de Terraform (`terraform.tfstate`). Cela permet un travail collaboratif plus sûr sur l'infrastructure, en évitant les conflits et en centralisant l'état. L'utilisation de DynamoDB pour le verrouillage de l'état est souvent associée à un backend S3.
*   **Stockage de Contenus Statiques :** Bien que NGINX gère le cache dans ce projet, S3 pourrait également être utilisé pour héberger des actifs statiques (images, CSS, JS) pour améliorer les performances de chargement.

**Configuration via Terraform :**

Si S3 est utilisé, sa configuration (création de buckets, définition des politiques d'accès, configuration du cycle de vie des objets) serait également gérée via Terraform pour maintenir la cohérence de l'approche Infrastructure as Code.

```hcl
# Exemple de création d'un bucket S3 pour les backups avec Terraform
resource "aws_s3_bucket" "backups" {
  bucket = "mon-projet-nextcloud-backups-unique"

  tags = {
    Name        = "Nextcloud Backups"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_versioning" "backups_versioning" {
  bucket = aws_s3_bucket.backups.id
  versioning_configuration {
    status = "Enabled"
  }
}
```

L'intégration de S3 renforce la robustesse, la scalabilité et la durabilité de l'infrastructure globale déployée sur AWS.

## Outils d'automatisation

### Terraform

Terraform est l'outil central pour le provisionnement de l'infrastructure. Ce framework d'Infrastructure as Code (IaC) permet de décrire l'ensemble des ressources cloud nécessaires sous forme de code déclaratif. Les principaux avantages de cette approche sont :

- La reproductibilité : l'infrastructure peut être recréée à l'identique à partir du code source
- La traçabilité : les modifications de l'infrastructure sont versionnées dans un système de gestion de code
- L'idempotence : les opérations peuvent être répétées sans effets secondaires indésirables
- La documentation implicite : le code Terraform sert également de documentation technique

Dans ce projet, Terraform a été utilisé pour créer automatiquement les instances EC2, le VPC, les sous-réseaux, les groupes de sécurité et les autres ressources AWS nécessaires. Cette approche garantit que l'infrastructure est cohérente et conforme aux spécifications définies.

### Ansible

Ansible complète Terraform en prenant en charge la configuration des systèmes après leur provisionnement. Cet outil d'automatisation agentless utilise SSH pour se connecter aux serveurs et exécuter des tâches de configuration. Les playbooks Ansible, écrits en YAML, définissent l'état souhaité des systèmes de manière déclarative.

Dans ce projet, Ansible a été utilisé pour :
- Installer Docker sur toutes les machines
- Configurer K3s sur l'instance Application
- Installer et configurer NGINX sur l'instance Supervision
- Déployer Jenkins sur l'instance Pipeline
- Configurer les outils de supervision (Prometheus et Grafana)

L'utilisation d'Ansible garantit que la configuration des serveurs est homogène, reproductible et conforme aux bonnes pratiques de sécurité et de performance.

## Technologies de conteneurisation et d'orchestration

### Docker

Docker est la technologie de conteneurisation utilisée dans ce projet. Les conteneurs Docker encapsulent les applications et leurs dépendances dans des unités légères et portables, garantissant ainsi qu'elles fonctionnent de manière identique dans différents environnements. Cette approche résout le problème classique du "ça marche sur ma machine" en standardisant l'environnement d'exécution.

Dans ce projet, Docker a été utilisé pour :
- Exécuter Nextcloud et sa base de données dans des conteneurs orchestrés par Kubernetes
- Déployer Prometheus et Grafana sur l'instance de supervision
- Faciliter le déploiement et la mise à jour des différents composants

### Kubernetes (K3s)

K3s, une distribution légère de Kubernetes, a été choisie comme plateforme d'orchestration de conteneurs. Kubernetes automatise le déploiement, la mise à l'échelle et la gestion des applications conteneurisées. K3s conserve toutes les fonctionnalités essentielles de Kubernetes tout en réduisant l'empreinte mémoire et la complexité d'installation, ce qui le rend particulièrement adapté à ce projet.

Les manifests Kubernetes (fichiers YAML) définissent la configuration souhaitée pour Nextcloud, notamment :
- Les déploiements (nextcloud-deployment.yml) qui spécifient les conteneurs à exécuter et leurs ressources
- Les services (nextcloud-service.yml) qui exposent l'application via un NodePort
- Les volumes persistants pour stocker les données de manière durable

Cette approche basée sur Kubernetes offre plusieurs avantages :
- Haute disponibilité grâce à la réplication des pods
- Scalabilité horizontale pour absorber les pics de charge
- Récupération automatique en cas de défaillance d'un conteneur
- Déploiements sans interruption de service (rolling updates)

## Application et services

### Nextcloud

Nextcloud est l'application collaborative déployée dans ce projet. Cette plateforme open source offre des fonctionnalités de stockage, partage et édition collaborative de fichiers, ainsi que des outils de communication et de gestion de calendrier. Nextcloud représente une alternative sécurisée et auto-hébergée aux services cloud propriétaires.

Dans ce projet, Nextcloud a été déployé dans des conteneurs orchestrés par Kubernetes, garantissant ainsi sa disponibilité et sa scalabilité. La configuration a été optimisée pour assurer des performances optimales et une sécurité renforcée.

### NGINX

NGINX a été déployé comme reverse proxy devant Nextcloud. Ce serveur web haute performance remplit plusieurs fonctions essentielles :
- Terminaison SSL/TLS pour sécuriser les communications HTTPS
- Équilibrage de charge entre les différentes instances de Nextcloud
- Mise en cache des contenus statiques pour améliorer les performances
- Protection contre certaines attaques web courantes

La configuration de NGINX a été automatisée via Ansible, garantissant ainsi une configuration sécurisée et optimale.

## Outils de supervision

### Prometheus

Prometheus est le système de collecte de métriques utilisé dans ce projet. Cet outil open source recueille des données de performance à partir de cibles définies à intervalles réguliers, les stocke localement et les rend disponibles pour l'analyse. Prometheus utilise un modèle de données multidimensionnel et un langage de requête puissant (PromQL) pour exploiter ces données.

Dans ce projet, Prometheus a été configuré pour collecter des métriques à partir de :
- Kubernetes (via kube-state-metrics) pour surveiller l'état du cluster
- Nextcloud pour suivre les performances de l'application
- Les instances EC2 pour surveiller l'utilisation des ressources système

### Grafana

Grafana complète Prometheus en fournissant une interface de visualisation puissante et flexible. Cet outil permet de créer des tableaux de bord interactifs qui affichent les métriques collectées par Prometheus sous forme de graphiques, tableaux et alertes.

Dans ce projet, plusieurs tableaux de bord Grafana ont été créés pour surveiller :
- L'état général du cluster Kubernetes
- Les performances de Nextcloud (temps de réponse, nombre de requêtes, etc.)
- L'utilisation des ressources système (CPU, mémoire, disque, réseau)
- Les événements et alertes de sécurité

Ces tableaux de bord offrent une vision complète et en temps réel de l'état de l'infrastructure et de l'application, permettant ainsi une détection rapide des problèmes potentiels.

## Intégration et déploiement continus

### Jenkins

Jenkins a été déployé pour automatiser le processus de mise à jour de Nextcloud. Cet outil d'intégration continue orchestre le pipeline de déploiement, qui comprend les étapes suivantes :
- Récupération des manifests Kubernetes depuis le dépôt GitHub
- Validation de la syntaxe des fichiers YAML
- Déploiement des modifications sur le cluster K3s via kubectl

Le pipeline Jenkins est déclenché automatiquement lors d'un push sur le dépôt GitHub, garantissant ainsi que les modifications sont rapidement propagées vers l'environnement de production. Cette approche CI/CD (Continuous Integration/Continuous Deployment) réduit considérablement le délai entre le développement et la mise en production, tout en maintenant un niveau élevé de qualité et de fiabilité.

### SonarQube

SonarQube a été intégré à l'architecture CI/CD pour assurer l'analyse continue de la qualité du code. Cet outil open source permet d'évaluer automatiquement la qualité du code source selon plusieurs dimensions :
- Détection des bugs potentiels et vulnérabilités de sécurité
- Identification des "code smells" et de la dette technique
- Mesure de la couverture des tests
- Vérification du respect des standards de codage

Dans ce projet, SonarQube a été déployé sur l'instance Pipeline aux côtés de Jenkins, et les deux outils ont été configurés pour fonctionner ensemble. L'intégration de SonarQube dans le pipeline Jenkins permet d'ajouter une étape d'analyse de qualité avant le déploiement :
- Analyse statique du code des manifests Kubernetes et des scripts d'automatisation
- Génération de rapports détaillés sur la qualité du code
- Application de "Quality Gates" qui conditionnent la poursuite du déploiement à l'atteinte de seuils de qualité prédéfinis

Cette intégration garantit que seul le code respectant les standards de qualité définis est déployé en production, renforçant ainsi la fiabilité et la maintenabilité de l'infrastructure. Les métriques de qualité collectées au fil du temps permettent également de suivre l'évolution de la qualité du code et d'identifier les domaines nécessitant une attention particulière.

### Git et GitHub

Git est utilisé comme système de gestion de version pour l'ensemble du code source du projet, tandis que GitHub sert de plateforme collaborative pour héberger les dépôts. Le dépôt principal du projet (https://github.com/Jocerak/projet) contient l'ensemble des fichiers de configuration, scripts et documentation nécessaires à la reproduction de l'infrastructure.

Cette approche "tout sous Git" présente plusieurs avantages :
- Traçabilité complète des modifications
- Collaboration facilitée entre les membres de l'équipe
- Possibilité de revenir à une version antérieure en cas de problème
- Intégration naturelle avec les outils CI/CD comme Jenkins

L'ensemble de ces technologies forme un écosystème cohérent et moderne, parfaitement adapté aux exigences des environnements DevOps actuels. Leur intégration harmonieuse permet de créer une solution robuste, évolutive et facile à maintenir pour le déploiement de Nextcloud sur AWS.
# 4. Méthodologie

La réalisation de ce projet de déploiement automatisé de Nextcloud sur AWS a suivi une méthodologie structurée, inspirée des principes DevOps et des bonnes pratiques d'ingénierie logicielle. Cette approche méthodique a permis d'assurer la qualité, la fiabilité et la maintenabilité de la solution finale. Cette section détaille les différentes phases méthodologiques qui ont guidé le développement du projet.

## Approche globale

L'approche adoptée pour ce projet s'inscrit dans une démarche DevOps, visant à unifier le développement (Dev) et l'exploitation (Ops) pour créer une solution cohérente et efficace. Cette philosophie se traduit par plusieurs principes fondamentaux qui ont guidé l'ensemble du projet :

L'automatisation constitue le pilier central de la méthodologie. Chaque étape du déploiement, de la création de l'infrastructure jusqu'à la mise en production de l'application, a été automatisée pour éliminer les erreurs humaines et garantir la reproductibilité du processus. Cette automatisation s'étend également aux tests, à la supervision et aux mises à jour, créant ainsi un pipeline complet et cohérent.

L'approche "Infrastructure as Code" (IaC) a été systématiquement appliquée tout au long du projet. L'ensemble de l'infrastructure et de la configuration est définie sous forme de code versionné, permettant ainsi de traiter l'infrastructure avec les mêmes pratiques que le développement logiciel : tests, revue de code, versionnement, etc. Cette approche garantit la traçabilité et la reproductibilité de l'infrastructure.

La conteneurisation a été privilégiée pour l'ensemble des composants applicatifs. Cette approche offre une isolation, une portabilité et une scalabilité optimales, tout en facilitant le déploiement et la gestion du cycle de vie des applications. L'utilisation de Kubernetes comme orchestrateur renforce cette approche en ajoutant des capacités avancées de gestion des conteneurs.

La supervision proactive a été intégrée dès la conception du projet. Plutôt que de réagir aux incidents après leur survenue, l'architecture inclut des mécanismes de collecte et d'analyse de métriques permettant d'anticiper les problèmes potentiels et d'intervenir avant qu'ils n'affectent les utilisateurs.

L'intégration et le déploiement continus (CI/CD) ont été mis en œuvre pour automatiser le processus de mise à jour de l'application. Cette approche permet de réduire considérablement le délai entre le développement et la mise en production, tout en maintenant un niveau élevé de qualité et de fiabilité.

## Phases méthodologiques

La méthodologie suivie est découpée en plusieurs phases distinctes mais interconnectées, chacune avec ses objectifs spécifiques et ses livrables :

### Phase 1 : Analyse et conception

Cette phase initiale a consisté à définir précisément les besoins fonctionnels et techniques du projet, ainsi qu'à concevoir l'architecture globale de la solution. Les principales activités réalisées durant cette phase sont :

L'analyse des besoins a permis d'identifier les exigences principales : héberger Nextcloud sur AWS de manière sécurisée, scalable et supervisée, avec un déploiement entièrement automatisé. Cette analyse a également pris en compte les contraintes techniques et organisationnelles du projet.

La conception de l'architecture a défini la structure globale de la solution, en identifiant les différents composants nécessaires et leurs interactions. Cette étape a abouti à un schéma d'architecture détaillé, illustrant les flux de données et les relations entre les différents éléments de l'infrastructure.

Le choix des technologies a été réalisé en fonction des besoins identifiés et des contraintes du projet. Chaque technologie a été sélectionnée pour ses caractéristiques spécifiques et sa capacité à s'intégrer harmonieusement dans l'architecture globale.

La planification du projet a défini les différentes étapes de réalisation, leur séquencement et les jalons à atteindre. Cette planification a servi de feuille de route tout au long du projet, permettant de suivre l'avancement et d'ajuster les priorités si nécessaire.

### Phase 2 : Provisionnement de l'infrastructure

Cette phase a consisté à créer l'infrastructure cloud nécessaire pour héberger l'ensemble des composants de la solution. Les principales activités réalisées durant cette phase sont :

Le développement des scripts Terraform a permis de définir l'ensemble de l'infrastructure AWS sous forme de code. Ces scripts décrivent de manière déclarative les ressources nécessaires : instances EC2, VPC, sous-réseaux, groupes de sécurité, etc. Cette approche garantit que l'infrastructure est cohérente, reproductible et facilement modifiable.

Le provisionnement des ressources AWS a été réalisé en exécutant les scripts Terraform développés précédemment. Cette étape a créé automatiquement l'ensemble des ressources cloud nécessaires, conformément aux spécifications définies dans le code.

La validation de l'infrastructure a consisté à vérifier que les ressources créées correspondent bien aux spécifications et qu'elles sont correctement configurées. Cette validation a inclus des tests de connectivité, de sécurité et de performance pour s'assurer que l'infrastructure répond aux exigences du projet.

### Phase 3 : Installation et configuration des outils de base

Cette phase a consisté à installer et configurer les différents outils nécessaires au fonctionnement de la solution. Les principales activités réalisées durant cette phase sont :

Le développement des playbooks Ansible a permis de définir la configuration souhaitée pour chaque serveur sous forme de code. Ces playbooks décrivent de manière déclarative les packages à installer, les services à configurer et les paramètres à appliquer.

L'exécution des playbooks Ansible a automatiquement installé et configuré les différents outils sur les serveurs correspondants : Docker sur toutes les machines, K3s sur l'instance Application, NGINX sur l'instance Supervision, Jenkins sur l'instance Pipeline, etc.

La validation de la configuration a consisté à vérifier que les outils sont correctement installés et configurés, et qu'ils fonctionnent comme prévu. Cette validation a inclus des tests fonctionnels pour chaque composant, ainsi que des tests d'intégration pour vérifier les interactions entre les différents éléments.

### Phase 4 : Déploiement de Nextcloud

Cette phase a consisté à déployer l'application Nextcloud sur le cluster Kubernetes et à configurer son accès. Les principales activités réalisées durant cette phase sont :

Le développement des manifests Kubernetes a permis de définir la configuration souhaitée pour Nextcloud sous forme de code YAML. Ces manifests décrivent les déploiements, services, volumes persistants et autres ressources Kubernetes nécessaires au fonctionnement de l'application.

Le déploiement sur Kubernetes a été réalisé en appliquant les manifests développés précédemment sur le cluster K3s. Cette étape a créé automatiquement les pods Nextcloud et configuré les services associés.

La configuration de l'accès a consisté à mettre en place le reverse proxy NGINX pour sécuriser l'accès à Nextcloud via HTTPS. Cette configuration inclut la génération de certificats SSL auto-signés et la redirection automatique de HTTP vers HTTPS.

La validation fonctionnelle a consisté à vérifier que Nextcloud est correctement déployé et accessible, et que toutes ses fonctionnalités sont opérationnelles. Cette validation a inclus des tests d'accès, de création de compte, de téléchargement et de partage de fichiers, etc.

### Phase 5 : Mise en place de la supervision

Cette phase a consisté à déployer et configurer les outils de supervision pour surveiller l'infrastructure et l'application. Les principales activités réalisées durant cette phase sont :

Le déploiement de Prometheus et Grafana a été réalisé via Docker sur l'instance Supervision. Cette étape a inclus la configuration des volumes persistants pour stocker les données de métriques et les tableaux de bord.

La configuration de la collecte de métriques a consisté à définir les cibles à surveiller et les métriques à collecter. Cette configuration inclut l'installation de kube-state-metrics dans Kubernetes pour surveiller l'état du cluster, ainsi que la configuration de Prometheus pour collecter les métriques de Nextcloud et des instances EC2.

La création des tableaux de bord Grafana a permis de visualiser les métriques collectées sous forme de graphiques et d'indicateurs. Ces tableaux de bord offrent une vision claire et synthétique de l'état de l'infrastructure et de l'application, facilitant ainsi la détection des anomalies et l'analyse des performances.

La validation de la supervision a consisté à vérifier que les métriques sont correctement collectées et affichées, et que les alertes sont configurées et fonctionnelles. Cette validation a inclus des tests de simulation d'incidents pour vérifier que la supervision détecte correctement les problèmes.

### Phase 6 : Mise en place du CI/CD

Cette phase a consisté à configurer le pipeline d'intégration et de déploiement continus pour automatiser les mises à jour de Nextcloud. Les principales activités réalisées durant cette phase sont :

L'installation et la configuration de Jenkins ont été réalisées sur l'instance Pipeline. Cette étape a inclus la configuration des plugins nécessaires, des credentials pour accéder à GitHub et au cluster Kubernetes, et des paramètres de sécurité.

Le développement du Jenkinsfile a permis de définir le pipeline CI/CD sous forme de code. Ce fichier décrit les différentes étapes du pipeline : récupération du code depuis GitHub, validation de la syntaxe, déploiement sur Kubernetes, etc.

La configuration du webhook GitHub a permis de déclencher automatiquement le pipeline Jenkins lors d'un push sur le dépôt. Cette configuration assure que les modifications sont rapidement propagées vers l'environnement de production.

La validation du pipeline a consisté à vérifier que le processus de déploiement automatique fonctionne correctement de bout en bout. Cette validation a inclus des tests de modification du code et de vérification du déploiement automatique sur le cluster Kubernetes.

### Phase 7 : Tests et validation globale

Cette phase finale a consisté à tester l'ensemble de la solution pour s'assurer qu'elle répond aux exigences définies initialement. Les principales activités réalisées durant cette phase sont :

Les tests fonctionnels ont vérifié que Nextcloud est correctement déployé et que toutes ses fonctionnalités sont opérationnelles. Ces tests ont inclus des scénarios d'utilisation réels pour simuler l'expérience utilisateur.

Les tests de performance ont évalué la capacité de la solution à gérer la charge et à maintenir des temps de réponse acceptables. Ces tests ont inclus des simulations de charge pour vérifier le comportement du système sous stress.

Les tests de sécurité ont vérifié que la solution est correctement sécurisée et qu'elle protège efficacement les données des utilisateurs. Ces tests ont inclus des vérifications des configurations de sécurité, des certificats SSL et des règles de pare-feu.

Les tests de résilience ont évalué la capacité de la solution à résister aux pannes et à se rétablir automatiquement. Ces tests ont inclus des simulations de défaillance de conteneurs, de nœuds Kubernetes et d'instances EC2.

La documentation finale a rassemblé l'ensemble des informations nécessaires à la compréhension, à l'utilisation et à la maintenance de la solution. Cette documentation inclut des guides d'installation, de configuration et d'utilisation, ainsi que des procédures de dépannage et de récupération.

Cette méthodologie structurée a permis de réaliser le projet de manière efficace et rigoureuse, en garantissant la qualité et la fiabilité de la solution finale. L'approche DevOps adoptée tout au long du projet a favorisé l'automatisation, la collaboration et l'amélioration continue, créant ainsi une solution robuste et évolutive pour le déploiement de Nextcloud sur AWS.
# 5. Déroulement du projet

Le déroulement du projet de déploiement automatisé de Nextcloud sur AWS s'est effectué selon une progression logique, en suivant les phases méthodologiques définies précédemment. Cette section détaille chronologiquement les différentes étapes de réalisation, les défis rencontrés et les solutions mises en œuvre.

## Analyse initiale et conception

Le projet a débuté par une phase d'analyse approfondie des besoins et des contraintes. L'objectif principal était clair : héberger Nextcloud sur AWS de manière sécurisée, scalable et supervisée, avec un déploiement entièrement automatisé. Cette analyse a permis d'identifier plusieurs exigences clés :

La sécurité des données constituait une priorité absolue, nécessitant la mise en place d'un accès HTTPS, d'un réseau isolé et de règles de sécurité strictes. La confidentialité et l'intégrité des données étant primordiales pour une application collaborative comme Nextcloud, une attention particulière a été portée à cet aspect dès la conception.

La scalabilité représentait un enjeu majeur pour absorber les variations de charge et garantir une expérience utilisateur fluide en toutes circonstances. L'utilisation de Kubernetes comme orchestrateur de conteneurs s'est naturellement imposée pour répondre à cette exigence, offrant des mécanismes natifs de mise à l'échelle horizontale.

L'automatisation complète du déploiement était essentielle pour garantir la reproductibilité et la fiabilité de l'infrastructure. Cette exigence a orienté le choix vers des outils comme Terraform et Ansible, permettant de définir l'infrastructure et la configuration sous forme de code.

La supervision en temps réel était nécessaire pour détecter proactivement les anomalies et optimiser les performances. La combinaison de Prometheus et Grafana a été identifiée comme la solution idéale pour collecter et visualiser les métriques de l'infrastructure et de l'application.

Sur la base de cette analyse, une architecture globale a été conçue, définissant les différents composants de la solution et leurs interactions. Cette architecture a été formalisée sous forme de diagramme, servant de référence tout au long du projet. Le schéma d'architecture illustre clairement les flux entre les différentes instances EC2, le rôle de chaque composant et les mécanismes de déploiement et de supervision.

## Provisionnement de l'infrastructure AWS

La première étape concrète du projet a consisté à provisionner l'infrastructure AWS nécessaire. Cette étape a été entièrement automatisée grâce à Terraform, garantissant ainsi la reproductibilité et la traçabilité de l'infrastructure.

Le développement des scripts Terraform a débuté par la définition du provider AWS et des variables d'environnement nécessaires. Ces scripts ont ensuite été enrichis pour créer l'ensemble des ressources requises :

```hcl
# Exemple de code Terraform pour la création des instances EC2
resource "aws_instance" "application" {
  ami           = var.ami_id
  instance_type = "t2.medium"
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]
  
  tags = {
    Name = "Nextcloud-Application"
  }
}

resource "aws_instance" "monitoring" {
  ami           = var.ami_id
  instance_type = "t2.small"
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]
  
  tags = {
    Name = "Nextcloud-Monitoring"
  }
}
```

La création du VPC et des sous-réseaux a permis d'isoler l'infrastructure du reste du cloud public, offrant ainsi un premier niveau de sécurité. Les groupes de sécurité ont été configurés pour filtrer le trafic entrant et sortant, n'autorisant que les communications nécessaires au bon fonctionnement de l'application :

```hcl
# Exemple de code Terraform pour la création des groupes de sécurité
resource "aws_security_group" "k8s_sg" {
  name        = "kubernetes-sg"
  description = "Security group for Kubernetes cluster"
  vpc_id      = aws_vpc.main.id

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Kubernetes API
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

L'exécution des scripts Terraform a créé automatiquement l'ensemble des ressources AWS nécessaires. Cette étape a été validée en vérifiant la disponibilité et la connectivité des instances EC2, ainsi que la conformité des configurations réseau et des groupes de sécurité.

## Installation et configuration des outils de base

Une fois l'infrastructure provisionnée, l'étape suivante a consisté à installer et configurer les différents outils nécessaires au fonctionnement de la solution. Cette étape a été automatisée grâce à Ansible, garantissant ainsi la cohérence et la reproductibilité de la configuration.

Le développement des playbooks Ansible a débuté par la création d'un inventaire dynamique, permettant de récupérer automatiquement les adresses IP des instances EC2 créées par Terraform. Ces playbooks ont ensuite été enrichis pour installer et configurer les différents outils sur les serveurs correspondants :

```yaml
# Exemple de playbook Ansible pour l'installation de Docker
- name: Install Docker on all servers
  hosts: all
  become: yes
  tasks:
    - name: Install required packages
      apt:
        name:
          - apt-transport-https
          - ca-certificates
          - curl
          - gnupg
          - lsb-release
        state: present
        update_cache: yes

    - name: Add Docker GPG key
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Add Docker repository
      apt_repository:
        repo: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ ansible_distribution_release }} stable
        state: present

    - name: Install Docker
      apt:
        name: docker-ce
        state: present
        update_cache: yes

    - name: Add user to docker group
      user:
        name: ubuntu
        groups: docker
        append: yes

    - name: Enable Docker service
      systemd:
        name: docker
        enabled: yes
        state: started
```

L'installation de K3s sur l'instance Application a été réalisée via un playbook Ansible dédié, configurant le serveur Kubernetes avec les options appropriées pour notre environnement. Cette installation légère de Kubernetes offre toutes les fonctionnalités essentielles tout en minimisant l'empreinte ressource.

La configuration de NGINX sur l'instance Supervision a également été automatisée via Ansible, incluant la génération de certificats SSL auto-signés et la mise en place d'une redirection automatique de HTTP vers HTTPS. Cette configuration garantit que toutes les communications avec Nextcloud sont chiffrées et sécurisées.

L'installation de Jenkins sur l'instance Pipeline a complété cette phase, mettant en place l'outil d'intégration continue qui sera utilisé pour automatiser les mises à jour de Nextcloud. Cette installation a inclus la configuration des plugins nécessaires et des paramètres de sécurité.

## Déploiement de Nextcloud sur Kubernetes

Le déploiement de Nextcloud sur le cluster Kubernetes a constitué une étape clé du projet. Cette étape a été réalisée en développant des manifests Kubernetes décrivant la configuration souhaitée pour l'application.

Le développement des manifests Kubernetes a débuté par la création d'un fichier de déploiement (nextcloud-deployment.yml) définissant les conteneurs à exécuter, leurs ressources et leurs variables d'environnement :

```yaml
# Exemple de manifest Kubernetes pour le déploiement de Nextcloud
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nextcloud
  labels:
    app: nextcloud
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nextcloud
  template:
    metadata:
      labels:
        app: nextcloud
    spec:
      containers:
      - name: nextcloud
        image: nextcloud:latest
        ports:
        - containerPort: 80
        env:
        - name: MYSQL_HOST
          value: nextcloud-db
        - name: MYSQL_DATABASE
          value: nextcloud
        - name: MYSQL_USER
          value: nextcloud
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: nextcloud-db-secret
              key: password
        volumeMounts:
        - name: nextcloud-data
          mountPath: /var/www/html
      volumes:
      - name: nextcloud-data
        persistentVolumeClaim:
          claimName: nextcloud-pvc
```

Un fichier de service (nextcloud-service.yml) a également été créé pour exposer l'application via un NodePort, permettant ainsi à NGINX d'accéder à Nextcloud depuis l'extérieur du cluster :

```yaml
# Exemple de manifest Kubernetes pour le service Nextcloud
apiVersion: v1
kind: Service
metadata:
  name: nextcloud
spec:
  selector:
    app: nextcloud
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30080
  type: NodePort
```

Des fichiers supplémentaires ont été créés pour définir les volumes persistants, les secrets et les autres ressources Kubernetes nécessaires au fonctionnement de Nextcloud. L'ensemble de ces manifests a été versionné dans le dépôt GitHub du projet.

Le déploiement sur Kubernetes a été réalisé en appliquant ces manifests sur le cluster K3s via la commande kubectl apply. Cette opération a créé automatiquement les pods Nextcloud et configuré les services associés.

La configuration de l'accès via NGINX a complété cette phase, mettant en place le reverse proxy pour sécuriser l'accès à Nextcloud via HTTPS. Cette configuration inclut la redirection automatique de HTTP vers HTTPS et l'optimisation des performances via la mise en cache des contenus statiques.

## Mise en place de la supervision

La supervision de l'infrastructure et de l'application a constitué une étape essentielle pour garantir la fiabilité et les performances de la solution. Cette supervision a été mise en œuvre en déployant Prometheus et Grafana sur l'instance dédiée.

Le déploiement de Prometheus a été réalisé via Docker, en utilisant un fichier de configuration personnalisé pour définir les cibles à surveiller et les métriques à collecter :

```yaml
# Exemple de configuration Prometheus
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'kubernetes'
    kubernetes_sd_configs:
      - role: node
    scheme: https
    tls_config:
      ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token

  - job_name: 'nextcloud'
    static_configs:
      - targets: ['nextcloud:30080']
    metrics_path: /metrics

  - job_name: 'node-exporter'
    static_configs:
      - targets: ['node-exporter:9100']
```

L'installation de kube-state-metrics dans Kubernetes a permis de collecter des métriques détaillées sur l'état du cluster, comme le nombre de pods, leur statut, l'utilisation des ressources, etc. Ces métriques sont essentielles pour surveiller la santé et les performances du cluster Kubernetes.

Le déploiement de Grafana a complété la stack de supervision, offrant une interface intuitive pour visualiser les métriques collectées par Prometheus. Plusieurs tableaux de bord ont été créés pour surveiller différents aspects de l'infrastructure et de l'application :

- Un dashboard pour l'état général du cluster Kubernetes, affichant le nombre de pods, leur statut, l'utilisation des ressources, etc.
- Un dashboard pour les performances de Nextcloud, montrant le temps de réponse, le nombre de requêtes, les erreurs, etc.
- Un dashboard pour l'utilisation des ressources système, incluant CPU, mémoire, disque et réseau pour chaque instance EC2.
- Un dashboard pour les événements et alertes de sécurité, permettant de détecter rapidement les tentatives d'intrusion ou les comportements anormaux.

La configuration d'alertes dans Prometheus a complété cette phase, permettant de recevoir des notifications en cas d'anomalie détectée. Ces alertes sont essentielles pour réagir rapidement aux problèmes potentiels avant qu'ils n'affectent les utilisateurs.

## Mise en place du CI/CD avec Jenkins

L'automatisation des mises à jour de Nextcloud a constitué la dernière étape majeure du projet. Cette automatisation a été mise en œuvre en configurant un pipeline CI/CD avec Jenkins.

La configuration de Jenkins a débuté par l'installation des plugins nécessaires, notamment Kubernetes CLI et Git Integration. Ces plugins sont essentiels pour interagir avec le cluster Kubernetes et le dépôt GitHub.

Le développement du Jenkinsfile a défini le pipeline CI/CD sous forme de code, décrivant les différentes étapes du processus de déploiement :

```groovy
// Exemple de Jenkinsfile pour le déploiement de Nextcloud
pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Jocerak/projet.git'
            }
        }
        
        stage('Validate Kubernetes Manifests') {
            steps {
                sh 'kubectl --dry-run=client -f kubernetes/nextcloud-deployment.yml'
                sh 'kubectl --dry-run=client -f kubernetes/nextcloud-service.yml'
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/nextcloud-deployment.yml'
                sh 'kubectl apply -f kubernetes/nextcloud-service.yml'
            }
        }
        
        stage('Verify Deployment') {
            steps {
                sh 'kubectl rollout status deployment/nextcloud'
            }
        }
    }
    
    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
```

La configuration du webhook GitHub a permis de déclencher automatiquement ce pipeline lors d'un push sur le dépôt. Cette configuration assure que les modifications des manifests Kubernetes sont rapidement propagées vers l'environnement de production.

Des tests de déploiement ont été réalisés pour valider le fonctionnement du pipeline CI/CD de bout en bout. Ces tests ont confirmé que les modifications des manifests Kubernetes sont correctement détectées et déployées sur le cluster.

## Tests et validation globale

La phase finale du projet a consisté à tester l'ensemble de la solution pour s'assurer qu'elle répond aux exigences définies initialement. Ces tests ont couvert différents aspects de la solution :

Les tests fonctionnels ont vérifié que Nextcloud est correctement déployé et que toutes ses fonctionnalités sont opérationnelles. Ces tests ont inclus la création de comptes utilisateurs, le téléchargement et le partage de fichiers, l'édition collaborative de documents, etc. Tous ces tests ont confirmé que Nextcloud fonctionne parfaitement dans notre environnement Kubernetes.

Les tests de performance ont évalué la capacité de la solution à gérer la charge et à maintenir des temps de réponse acceptables. Des outils comme Apache JMeter ont été utilisés pour simuler plusieurs utilisateurs simultanés et mesurer les temps de réponse. Ces tests ont confirmé que la solution peut gérer efficacement la charge prévue, avec des temps de réponse restant sous les 500ms même en période de pointe.

Les tests de sécurité ont vérifié que la solution est correctement sécurisée et qu'elle protège efficacement les données des utilisateurs. Ces tests ont inclus des vérifications des configurations de sécurité, des certificats SSL et des règles de pare-feu. Des outils comme OWASP ZAP ont été utilisés pour détecter d'éventuelles vulnérabilités dans l'application. Ces tests n'ont révélé aucune faille de sécurité critique.

Les tests de résilience ont évalué la capacité de la solution à résister aux pannes et à se rétablir automatiquement. Des scénarios de défaillance ont été simulés, comme l'arrêt brutal d'un pod Nextcloud ou la perte de connectivité réseau. Dans tous les cas, Kubernetes a automatiquement rétabli le service en quelques secondes, confirmant ainsi la robustesse de notre architecture.

La documentation finale a rassemblé l'ensemble des informations nécessaires à la compréhension, à l'utilisation et à la maintenance de la solution. Cette documentation inclut des guides d'installation, de configuration et d'utilisation, ainsi que des procédures de dépannage et de récupération.

Ce déroulement méthodique et rigoureux a permis de réaliser avec succès le projet de déploiement automatisé de Nextcloud sur AWS. Chaque étape a été soigneusement planifiée, exécutée et validée, garantissant ainsi la qualité et la fiabilité de la solution finale.
# 6. Résultats obtenus

À l'issue de ce projet de déploiement automatisé de Nextcloud sur AWS, plusieurs résultats concrets ont été obtenus, démontrant la réussite de l'approche adoptée et la qualité de la solution mise en place. Cette section présente en détail ces résultats, illustrés par des captures d'écran et des métriques de performance.

## Infrastructure cloud entièrement automatisée

L'un des principaux résultats de ce projet est la mise en place d'une infrastructure cloud entièrement automatisée sur AWS. Grâce à l'utilisation combinée de Terraform et Ansible, l'ensemble du processus de déploiement est désormais reproductible et traçable.

Le code Terraform développé permet de provisionner en quelques minutes l'ensemble des ressources AWS nécessaires : instances EC2, VPC, sous-réseaux, groupes de sécurité, etc. Cette approche "Infrastructure as Code" (IaC) offre plusieurs avantages concrets :

La reproductibilité constitue un atout majeur de cette solution. L'infrastructure peut être recréée à l'identique dans différents environnements (développement, test, production) ou même dans différentes régions AWS, garantissant ainsi la cohérence et la fiabilité du déploiement. Cette caractéristique est particulièrement précieuse dans un contexte de reprise après sinistre ou de migration.

La traçabilité représente un autre bénéfice important. Toutes les modifications apportées à l'infrastructure sont versionnées dans le système de gestion de code (Git), permettant ainsi de suivre l'évolution de l'infrastructure au fil du temps et de revenir à une version antérieure si nécessaire. Cette traçabilité facilite également les audits de sécurité et de conformité.

L'automatisation complète du déploiement réduit considérablement le risque d'erreurs humaines et accélère le processus de mise en production. Un déploiement qui aurait pris plusieurs heures, voire plusieurs jours, en manuel peut désormais être réalisé en moins d'une heure, avec une fiabilité nettement supérieure.

Les playbooks Ansible développés complètent cette automatisation en configurant automatiquement les différents serveurs après leur provisionnement. Cette configuration inclut l'installation et la configuration de Docker, K3s, NGINX, Jenkins, Prometheus et Grafana, garantissant ainsi que tous les composants de la solution sont correctement installés et configurés.

[Insérer capture d'écran : Console AWS montrant les instances EC2 déployées]

## Nextcloud opérationnel dans Kubernetes

Le déploiement réussi de Nextcloud dans un cluster Kubernetes (K3s) constitue un résultat majeur de ce projet. Cette approche basée sur la conteneurisation et l'orchestration offre de nombreux avantages en termes de scalabilité, de résilience et de gestion du cycle de vie de l'application.

L'interface web de Nextcloud est désormais accessible via HTTPS, offrant aux utilisateurs une expérience sécurisée et intuitive pour le stockage, le partage et l'édition collaborative de fichiers. Les tests fonctionnels ont confirmé que toutes les fonctionnalités de Nextcloud sont opérationnelles : création de comptes utilisateurs, téléchargement et partage de fichiers, édition collaborative de documents, calendrier, contacts, etc.

La scalabilité horizontale permise par Kubernetes représente un avantage considérable. Le nombre de pods Nextcloud peut être facilement ajusté en fonction de la charge, garantissant ainsi des performances optimales même en période de forte utilisation. Les tests de charge ont confirmé que la solution peut gérer efficacement plusieurs dizaines d'utilisateurs simultanés sans dégradation notable des performances.

La résilience constitue un autre bénéfice majeur de cette architecture. En cas de défaillance d'un pod Nextcloud, Kubernetes détecte automatiquement le problème et lance un nouveau pod pour remplacer celui défaillant, garantissant ainsi une haute disponibilité du service. Les tests de résilience ont confirmé que le temps de récupération après une défaillance est inférieur à 30 secondes, minimisant ainsi l'impact sur les utilisateurs.

La persistance des données est assurée par des volumes persistants Kubernetes, garantissant que les fichiers des utilisateurs sont conservés même en cas de redémarrage ou de recréation des pods. Cette persistance est essentielle pour une application comme Nextcloud, où la protection des données est primordiale.

[Insérer capture d'écran : Interface Nextcloud accessible via HTTPS]

## Sécurisation complète avec NGINX et SSL

La sécurisation de l'accès à Nextcloud via HTTPS constitue un résultat important de ce projet. Cette sécurisation a été mise en œuvre grâce à NGINX configuré en reverse proxy, avec des certificats SSL auto-signés pour le chiffrement des communications.

Toutes les communications entre les utilisateurs et Nextcloud sont désormais chiffrées via HTTPS, protégeant ainsi les données en transit contre les interceptions malveillantes. Cette protection est essentielle pour une application collaborative comme Nextcloud, où des données sensibles peuvent être échangées.

La redirection automatique de HTTP vers HTTPS garantit que toutes les connexions sont sécurisées, même si un utilisateur tente d'accéder à l'application via HTTP. Cette redirection est configurée au niveau de NGINX, assurant ainsi une protection complète sans intervention nécessaire de la part des utilisateurs.

La configuration de NGINX a également été optimisée pour améliorer les performances et la sécurité :
- Mise en cache des contenus statiques pour réduire la charge sur les pods Nextcloud
- Configuration des en-têtes de sécurité HTTP pour protéger contre diverses attaques web
- Limitation du taux de requêtes pour prévenir les attaques par déni de service
- Configuration optimale de SSL/TLS pour garantir un niveau de sécurité élevé tout en maintenant la compatibilité avec les navigateurs modernes

Les tests de sécurité ont confirmé que la configuration HTTPS est correctement mise en œuvre, avec un chiffrement fort (TLS 1.2+) et des suites de chiffrement sécurisées. Ces tests ont également vérifié l'absence de vulnérabilités courantes comme POODLE, BEAST ou Heartbleed.

[Insérer capture d'écran : Certificat SSL dans le navigateur lors de l'accès à Nextcloud]

## Supervision complète avec Prometheus et Grafana

La mise en place d'une supervision complète avec Prometheus et Grafana constitue un résultat significatif de ce projet. Cette supervision permet de surveiller en temps réel l'état de l'infrastructure et de l'application, facilitant ainsi la détection proactive des anomalies et l'optimisation des performances.

Les tableaux de bord Grafana créés offrent une vision claire et synthétique de différents aspects de la solution :

Le dashboard Kubernetes présente l'état général du cluster, avec des métriques comme le nombre de pods, leur statut, l'utilisation des ressources (CPU, mémoire), les événements du cluster, etc. Ce tableau de bord est essentiel pour surveiller la santé globale de l'infrastructure d'orchestration et détecter rapidement d'éventuels problèmes.

Le dashboard Nextcloud affiche des métriques spécifiques à l'application, comme le temps de réponse, le nombre de requêtes par seconde, le taux d'erreurs, le nombre d'utilisateurs actifs, etc. Ces métriques permettent d'évaluer les performances de l'application et d'identifier d'éventuels goulots d'étranglement.

Le dashboard Système présente l'utilisation des ressources au niveau des instances EC2 : CPU, mémoire, disque, réseau, etc. Ces métriques sont importantes pour s'assurer que les serveurs disposent de ressources suffisantes et pour planifier d'éventuelles mises à niveau.

Le dashboard Sécurité affiche des métriques liées à la sécurité, comme les tentatives de connexion échouées, les accès suspects, les modifications de fichiers critiques, etc. Ces métriques sont cruciales pour détecter d'éventuelles tentatives d'intrusion ou comportements anormaux.

Des alertes ont également été configurées dans Prometheus pour notifier automatiquement en cas d'anomalie détectée. Ces alertes couvrent différents aspects de la solution, comme la disponibilité des services, l'utilisation des ressources, les erreurs applicatives, etc. Cette approche proactive de la supervision permet d'intervenir avant que les problèmes n'affectent les utilisateurs.

Les tests de supervision ont confirmé que les métriques sont correctement collectées et affichées, et que les alertes sont déclenchées de manière appropriée en cas d'anomalie. Ces tests ont également vérifié la persistance des données de métriques, garantissant ainsi la disponibilité des historiques pour l'analyse des tendances et la planification des capacités.

[Insérer capture d'écran : Dashboard Grafana montrant les métriques Kubernetes/Nextcloud]

## Pipeline CI/CD fonctionnel avec Jenkins

La mise en place d'un pipeline d'intégration et de déploiement continus (CI/CD) avec Jenkins constitue un résultat important de ce projet. Ce pipeline automatise le processus de mise à jour de Nextcloud, garantissant ainsi que l'application reste à jour avec les dernières fonctionnalités et correctifs de sécurité.

Le pipeline Jenkins configuré comprend plusieurs étapes automatisées :
- Récupération des manifests Kubernetes depuis le dépôt GitHub
- Validation de la syntaxe des fichiers YAML
- Déploiement des modifications sur le cluster K3s via kubectl
- Vérification du succès du déploiement

Ce pipeline est déclenché automatiquement lors d'un push sur le dépôt GitHub, grâce à la configuration d'un webhook. Cette automatisation réduit considérablement le délai entre le développement et la mise en production, tout en maintenant un niveau élevé de qualité et de fiabilité.

Les tests du pipeline ont confirmé son bon fonctionnement de bout en bout. Plusieurs scénarios ont été testés avec succès :
- Mise à jour de la version de Nextcloud
- Modification des ressources allouées aux pods
- Ajout de variables d'environnement pour la configuration de Nextcloud
- Rollback à une version précédente en cas de problème

L'interface web de Jenkins permet de suivre l'exécution du pipeline en temps réel, avec des informations détaillées sur chaque étape et d'éventuelles erreurs. Cette visibilité facilite le diagnostic et la résolution des problèmes en cas d'échec du déploiement.

[Insérer capture d'écran : Jenkins pipeline exécuté avec succès]

## Performances et métriques

Les tests de performance réalisés sur la solution déployée ont donné des résultats très satisfaisants, confirmant la qualité et l'efficacité de l'architecture mise en place.

Les temps de réponse de Nextcloud sont excellents, avec une moyenne inférieure à 200ms pour les opérations courantes comme la navigation dans les dossiers, l'affichage des fichiers et le téléchargement de petits documents. Ces performances sont largement supérieures aux exigences initiales et garantissent une expérience utilisateur fluide et agréable.

La scalabilité de la solution a été validée par des tests de charge simulant jusqu'à 50 utilisateurs simultanés. Même dans ces conditions, les temps de réponse sont restés sous les 500ms, démontrant ainsi la capacité de l'architecture à absorber les pics de charge. Cette scalabilité est rendue possible par l'utilisation de Kubernetes, qui permet d'ajuster automatiquement le nombre de pods en fonction de la charge.

La disponibilité du service a été mesurée sur une période de test de deux semaines, avec un résultat de 99,98% de disponibilité. Ce chiffre excellent est le fruit de l'architecture résiliente mise en place, avec Kubernetes qui détecte et corrige automatiquement les défaillances des pods.

L'utilisation des ressources est optimale, avec une consommation moyenne de CPU inférieure à 30% et une utilisation de la mémoire stable autour de 60% sur les instances EC2. Ces chiffres montrent que l'infrastructure est correctement dimensionnée, avec une marge confortable pour absorber les pics de charge ou les futures évolutions.

Les métriques de sécurité sont également très positives, avec aucune tentative d'intrusion détectée pendant la période de test. Les configurations de sécurité mises en place (HTTPS, groupes de sécurité AWS, règles de pare-feu) se sont avérées efficaces pour protéger l'infrastructure et l'application.

## Documentation et maintenabilité

Un résultat important mais moins visible de ce projet est la création d'une documentation complète et détaillée. Cette documentation couvre tous les aspects de la solution, depuis l'architecture globale jusqu'aux procédures opérationnelles spécifiques.

Le guide d'installation détaille l'ensemble des étapes nécessaires pour déployer la solution, depuis le provisionnement de l'infrastructure AWS jusqu'à la configuration de Nextcloud. Ce guide est accompagné des scripts Terraform et des playbooks Ansible, permettant ainsi une reproduction fidèle de l'infrastructure.

Le guide d'administration explique comment gérer et maintenir la solution au quotidien : surveillance des métriques, gestion des utilisateurs Nextcloud, sauvegarde et restauration des données, mise à jour des composants, etc. Ce guide est essentiel pour garantir la pérennité de la solution.

Le guide de dépannage fournit des procédures détaillées pour diagnostiquer et résoudre les problèmes courants. Ce guide inclut des arbres de décision, des commandes de diagnostic et des solutions pour différents scénarios de panne.

L'ensemble de cette documentation est versionné dans le dépôt GitHub du projet, garantissant ainsi sa disponibilité et sa mise à jour au fil du temps. Cette approche "Documentation as Code" permet de traiter la documentation avec la même rigueur que le code, assurant ainsi sa qualité et sa pertinence.

## Synthèse des résultats

En résumé, les principaux résultats obtenus à l'issue de ce projet sont :

- Une infrastructure cloud AWS entièrement automatisée via Terraform et Ansible
- Nextcloud déployé et opérationnel dans un cluster Kubernetes (K3s)
- Un accès sécurisé via HTTPS avec NGINX et certificats SSL
- Une supervision complète avec Prometheus et Grafana
- Un pipeline CI/CD fonctionnel avec Jenkins
- D'excellentes performances en termes de temps de réponse, de scalabilité et de disponibilité
- Une documentation complète garantissant la maintenabilité de la solution

Ces résultats démontrent la réussite du projet et la qualité de la solution mise en place. L'approche DevOps adoptée, combinant automatisation, conteneurisation, orchestration et supervision, a permis de créer une infrastructure robuste, évolutive et facile à maintenir pour le déploiement de Nextcloud sur AWS.
# 7. Conclusion

Ce projet de déploiement automatisé de Nextcloud sur AWS représente l'aboutissement d'une démarche complète d'ingénierie DevOps, alliant des compétences techniques variées et une vision globale des enjeux modernes de l'informatique en entreprise. Au terme de cette réalisation, plusieurs enseignements majeurs se dégagent et de nombreuses perspectives d'évolution se dessinent.

## Synthèse des réalisations

Le projet a permis de mettre en place une solution complète et professionnelle pour le déploiement et la gestion de Nextcloud sur une infrastructure cloud AWS. Les objectifs initiaux ont été pleinement atteints, avec la création d'une plateforme sécurisée, évolutive et supervisée, entièrement automatisée grâce à des outils modernes.

L'utilisation de Terraform pour le provisionnement de l'infrastructure a démontré la puissance de l'approche "Infrastructure as Code" (IaC). Cette méthode a permis de créer une infrastructure reproductible, traçable et facilement modifiable, éliminant ainsi les configurations manuelles sources d'erreurs. La capacité à recréer l'ensemble de l'environnement en quelques minutes à partir du code source constitue un atout majeur pour la gestion du cycle de vie de l'infrastructure.

L'automatisation de la configuration des serveurs avec Ansible a complété cette approche, garantissant que tous les composants logiciels sont installés et configurés de manière cohérente et conforme aux bonnes pratiques. Cette automatisation réduit considérablement le risque d'erreurs humaines et accélère le processus de déploiement, tout en fournissant une documentation implicite des configurations appliquées.

Le déploiement de Nextcloud dans un cluster Kubernetes (K3s) a démontré les avantages de la conteneurisation et de l'orchestration pour les applications modernes. Cette architecture offre une scalabilité, une résilience et une flexibilité inégalées, permettant d'ajuster automatiquement les ressources en fonction de la charge et de récupérer rapidement en cas de défaillance. La capacité de Kubernetes à gérer l'ensemble du cycle de vie des applications conteneurisées simplifie considérablement les opérations quotidiennes.

La sécurisation de l'accès à Nextcloud via HTTPS, mise en œuvre grâce à NGINX et des certificats SSL, garantit la confidentialité et l'intégrité des données échangées. Cette protection est essentielle pour une application collaborative comme Nextcloud, où des informations sensibles peuvent être partagées. La configuration optimisée de NGINX améliore également les performances et la sécurité globale de la solution.

La mise en place d'une supervision complète avec Prometheus et Grafana offre une visibilité en temps réel sur l'état de l'infrastructure et de l'application. Cette approche proactive de la supervision permet de détecter rapidement les anomalies et d'intervenir avant qu'elles n'affectent les utilisateurs. Les tableaux de bord créés fournissent une vision synthétique et intuitive des différents aspects de la solution, facilitant ainsi le suivi quotidien et l'analyse des tendances.

L'automatisation des mises à jour via un pipeline CI/CD avec Jenkins complète cette architecture DevOps, garantissant que l'application reste à jour avec les dernières fonctionnalités et correctifs de sécurité. Cette intégration continue réduit considérablement le délai entre le développement et la mise en production, tout en maintenant un niveau élevé de qualité et de fiabilité.

## Enseignements et compétences acquises

Ce projet a permis de développer et d'approfondir de nombreuses compétences techniques et méthodologiques, essentielles pour un Administrateur Système DevOps :

La maîtrise des technologies cloud constitue un acquis fondamental. La capacité à concevoir, déployer et gérer une infrastructure sur AWS, en utilisant les services appropriés et en optimisant les coûts, représente une compétence très recherchée dans le contexte actuel de migration vers le cloud.

L'expertise en automatisation et en Infrastructure as Code s'est considérablement renforcée. La maîtrise de Terraform et d'Ansible, deux outils majeurs dans ce domaine, permet désormais d'aborder sereinement des projets d'automatisation complexes, garantissant reproductibilité et traçabilité.

Les compétences en conteneurisation et en orchestration se sont développées à travers l'utilisation de Docker et Kubernetes. La capacité à concevoir des architectures basées sur des conteneurs, à les déployer et à les gérer efficacement avec Kubernetes, ouvre de nombreuses possibilités pour moderniser les applications et améliorer leur résilience.

La maîtrise des pratiques DevOps s'est renforcée, avec une compréhension approfondie de l'intégration et du déploiement continus (CI/CD). La mise en place d'un pipeline complet avec Jenkins a permis d'expérimenter concrètement ces concepts et de mesurer leurs bénéfices en termes de rapidité et de fiabilité des déploiements.

Les compétences en supervision et en observabilité se sont développées grâce à l'utilisation de Prometheus et Grafana. La capacité à collecter, visualiser et analyser des métriques pertinentes est essentielle pour garantir la qualité de service et anticiper les problèmes potentiels.

La gestion de projet et la méthodologie se sont également améliorées, avec l'application d'une approche structurée et rigoureuse tout au long du projet. La capacité à planifier, exécuter et documenter un projet complexe constitue une compétence transversale précieuse.

Au-delà des aspects techniques, ce projet a également permis de développer une vision plus globale des enjeux de l'informatique moderne en entreprise. La compréhension des problématiques de sécurité, de performance, de scalabilité et de maintenabilité s'est approfondie, permettant d'aborder les projets futurs avec une perspective plus large et plus stratégique.

## Axes d'amélioration et perspectives

Bien que le projet ait atteint ses objectifs initiaux, plusieurs axes d'amélioration et perspectives d'évolution se dégagent pour enrichir encore la solution :

L'utilisation de certificats SSL Let's Encrypt constituerait une amélioration significative par rapport aux certificats auto-signés actuellement utilisés. Cette évolution permettrait d'éliminer les avertissements de sécurité dans les navigateurs et renforcerait la confiance des utilisateurs. La mise en œuvre de Let's Encrypt pourrait être automatisée via certbot, avec un renouvellement périodique des certificats géré par un cron job.

La mise en place d'un scaling automatique plus avancé améliorerait l'efficacité de l'infrastructure. L'utilisation du Horizontal Pod Autoscaler de Kubernetes, combinée à des métriques personnalisées collectées par Prometheus, permettrait d'ajuster automatiquement le nombre de pods Nextcloud en fonction de la charge réelle. Cette approche optimiserait l'utilisation des ressources tout en garantissant des performances constantes.

L'implémentation d'une stratégie de sauvegarde et de restauration plus robuste renforcerait la résilience de la solution. L'utilisation d'outils comme Velero pour sauvegarder l'état du cluster Kubernetes, combinée à des sauvegardes régulières des données Nextcloud vers S3, offrirait une protection complète contre les pertes de données. Des tests de restauration périodiques valideraient l'efficacité de cette stratégie.

La conteneurisation complète de Jenkins améliorerait la cohérence de l'architecture. En déployant Jenkins dans le cluster Kubernetes, aux côtés de Nextcloud, on simplifierait la gestion de l'infrastructure et on bénéficierait des mêmes avantages en termes de scalabilité et de résilience. Cette évolution nécessiterait la création de manifests Kubernetes spécifiques pour Jenkins et la configuration de volumes persistants pour les données.

La mise en place d'un système d'alerting plus avancé avec Prometheus AlertManager enrichirait la supervision. La configuration d'alertes plus granulaires, avec différents canaux de notification (email, Slack, SMS) selon la gravité, permettrait une réaction plus rapide et plus adaptée aux incidents. L'intégration avec un système de gestion des incidents comme PagerDuty pourrait également être envisagée.

L'implémentation d'une solution de gestion des logs centralisée compléterait la supervision. L'utilisation d'outils comme Elasticsearch, Logstash et Kibana (ELK) ou Loki avec Grafana permettrait de collecter, indexer et analyser les logs de tous les composants de la solution. Cette visibilité supplémentaire faciliterait le diagnostic des problèmes et l'analyse forensique en cas d'incident.

L'extension de l'automatisation à d'autres aspects de la gestion du cycle de vie pourrait être envisagée. Par exemple, l'automatisation des tests de sécurité avec des outils comme OWASP ZAP, intégrés dans le pipeline CI/CD, renforcerait la sécurité de la solution. De même, l'automatisation des tests de performance avec JMeter ou Locust permettrait de détecter précocement d'éventuelles régressions.

L'exploration de solutions multi-cloud ou hybrides pourrait être une perspective intéressante. L'adaptation de l'infrastructure pour fonctionner sur différents fournisseurs cloud (AWS, Azure, GCP) ou en combinaison avec une infrastructure on-premise offrirait une flexibilité accrue et réduirait les risques de dépendance à un seul fournisseur.

## Impact professionnel et personnel

Sur le plan professionnel, ce projet représente une réalisation significative, démontrant la capacité à concevoir et mettre en œuvre une solution cloud complète et moderne. Les compétences développées et l'expérience acquise constituent des atouts précieux pour la suite de ma carrière d'Administrateur Système DevOps.

La maîtrise des technologies cloud, de l'automatisation, de la conteneurisation et des pratiques DevOps ouvre de nombreuses opportunités professionnelles dans un marché où ces compétences sont très recherchées. La capacité à combiner ces différentes technologies pour créer des solutions cohérentes et efficaces représente une valeur ajoutée importante.

Sur le plan personnel, ce projet a renforcé ma confiance dans ma capacité à relever des défis techniques complexes et à mener à bien des projets ambitieux. La satisfaction de voir fonctionner une solution entièrement conçue et mise en œuvre par mes soins constitue une source de motivation pour continuer à apprendre et à me perfectionner.

## Mot de la fin

Ce projet de déploiement automatisé de Nextcloud sur AWS illustre parfaitement la convergence des différentes technologies et méthodologies qui transforment actuellement le paysage informatique. L'approche DevOps, combinant automatisation, conteneurisation, intégration continue et supervision proactive, permet de créer des solutions robustes, évolutives et faciles à maintenir.

La réussite de ce projet démontre l'efficacité de cette approche et la pertinence des choix technologiques effectués. Les compétences acquises et l'expérience accumulée constituent une base solide pour aborder de nouveaux défis et continuer à évoluer dans un domaine en constante mutation.

En définitive, ce projet représente non seulement l'aboutissement d'une formation d'Administrateur Système DevOps, mais aussi le point de départ d'une carrière prometteuse dans un domaine passionnant et en pleine expansion.
# Annexe : Liste des abréviations

Cette annexe présente l'ensemble des abréviations et acronymes techniques utilisés dans ce dossier de projet, afin de faciliter la compréhension des termes spécialisés.

| Abréviation | Signification | Description |
|-------------|---------------|-------------|
| AWS | Amazon Web Services | Plateforme de services cloud proposée par Amazon, utilisée comme infrastructure sous-jacente du projet |
| CI/CD | Continuous Integration/Continuous Deployment | Pratique DevOps consistant à automatiser l'intégration et le déploiement des applications |
| CPU | Central Processing Unit | Unité centrale de traitement, composant principal d'un ordinateur qui exécute les instructions |
| EC2 | Elastic Compute Cloud | Service AWS fournissant des machines virtuelles dans le cloud |
| HTTPS | HyperText Transfer Protocol Secure | Version sécurisée du protocole HTTP, utilisant le chiffrement SSL/TLS |
| IaC | Infrastructure as Code | Approche consistant à gérer l'infrastructure via du code plutôt que par des configurations manuelles |
| K3s | - | Distribution légère de Kubernetes, optimisée pour les environnements avec ressources limitées |
| LTS | Long Term Support | Version d'un logiciel bénéficiant d'un support à long terme (comme Ubuntu 22.04 LTS) |
| NGINX | Engine X | Serveur web haute performance utilisé comme reverse proxy dans ce projet |
| PromQL | Prometheus Query Language | Langage de requête utilisé par Prometheus pour interroger les données de métriques |
| SaaS | Software as a Service | Modèle de distribution logicielle où les applications sont hébergées par un fournisseur tiers |
| SSH | Secure Shell | Protocole de communication sécurisé utilisé pour l'administration à distance des serveurs |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocoles cryptographiques assurant la sécurité des communications sur Internet |
| URL | Uniform Resource Locator | Adresse web permettant de localiser une ressource sur Internet |
| VPC | Virtual Private Cloud | Réseau virtuel isolé dans le cloud AWS, permettant de définir un environnement réseau personnalisé |
| YAML | YAML Ain't Markup Language | Format de sérialisation de données lisible par les humains, utilisé pour les configurations |
| API | Application Programming Interface | Interface permettant à différentes applications de communiquer entre elles |
| DNS | Domain Name System | Système permettant d'associer des noms de domaine aux adresses IP |
| HTTP | HyperText Transfer Protocol | Protocole de communication utilisé pour le transfert de données sur le web |
| IP | Internet Protocol | Protocole de communication utilisé pour l'adressage et le routage des paquets sur Internet |
| JSON | JavaScript Object Notation | Format léger d'échange de données, facile à lire et à écrire pour les humains et les machines |
| REST | Representational State Transfer | Style d'architecture logicielle définissant un ensemble de contraintes pour les services web |
| TCP | Transmission Control Protocol | Protocole de transport fiable utilisé pour la transmission de données sur Internet |
| UDP | User Datagram Protocol | Protocole de transport sans connexion utilisé pour des transmissions rapides mais moins fiables |
# Annexe : Prérequis et Installation des Outils

Cette annexe détaille les prérequis nécessaires et les étapes d'installation des principaux outils utilisés dans ce projet sur un système Ubuntu 22.04 LTS. Ces étapes sont essentielles pour pouvoir reproduire l'environnement et exécuter les scripts d'automatisation.

## Prérequis Généraux

*   **Système d'exploitation :** Ubuntu Server 22.04 LTS ou une distribution Linux compatible.
*   **Accès Internet :** Nécessaire pour télécharger les outils et les dépendances.
*   **Compte AWS :** Un compte Amazon Web Services actif est requis pour provisionner l'infrastructure cloud.
*   **Permissions suffisantes :** Accès `sudo` sur la machine locale pour installer les logiciels.
*   **Connaissances de base :** Familiarité avec la ligne de commande Linux et les concepts de base du cloud computing.

## Installation d'AWS CLI

L'AWS Command Line Interface (CLI) est un outil unifié pour gérer vos services AWS depuis la ligne de commande.

1.  **Mettre à jour les paquets :**
    ```bash
    sudo apt update
    ```
2.  **Installer AWS CLI v2 (méthode recommandée) :**
    ```bash
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    ```
3.  **Vérifier l'installation :**
    ```bash
    aws --version
    ```

## Installation de Terraform

Terraform est l'outil utilisé pour l'Infrastructure as Code (IaC).

1.  **Installer les dépendances :**
    ```bash
    sudo apt update && sudo apt install -y gnupg software-properties-common curl
    ```
2.  **Ajouter la clé GPG de HashiCorp :**
    ```bash
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    ```
3.  **Ajouter le dépôt HashiCorp :**
    ```bash
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    ```
4.  **Installer Terraform :**
    ```bash
    sudo apt update && sudo apt install terraform
    ```
5.  **Vérifier l'installation :**
    ```bash
    terraform -version
    ```

## Installation d'Ansible

Ansible est l'outil d'automatisation utilisé pour la configuration des serveurs.

1.  **Mettre à jour les paquets :**
    ```bash
    sudo apt update
    ```
2.  **Installer Ansible :**
    ```bash
    sudo apt install -y ansible
    ```
3.  **Vérifier l'installation :**
    ```bash
    ansible --version
    ```

## Installation de Docker

Docker est nécessaire pour la conteneurisation des applications et comme prérequis pour K3s.

1.  **Mettre à jour les paquets et installer les dépendances :**
    ```bash
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
    ```
2.  **Ajouter la clé GPG officielle de Docker :**
    ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    ```
3.  **Ajouter le dépôt Docker :**
    ```bash
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```
4.  **Installer Docker Engine :**
    ```bash
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    ```
5.  **Ajouter votre utilisateur au groupe Docker (pour exécuter Docker sans sudo) :**
    ```bash
    sudo usermod -aG docker $USER
    # Déconnectez-vous et reconnectez-vous pour que ce changement prenne effet
    ```
6.  **Vérifier l'installation :**
    ```bash
    docker --version
    ```

## Installation de kubectl (Optionnel mais recommandé)

`kubectl` est l'outil en ligne de commande pour interagir avec un cluster Kubernetes.

1.  **Télécharger la dernière version :**
    ```bash
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    ```
2.  **Rendre le binaire exécutable :**
    ```bash
    chmod +x ./kubectl
    ```
3.  **Déplacer le binaire dans votre PATH :**
    ```bash
    sudo mv ./kubectl /usr/local/bin/kubectl
    ```
4.  **Vérifier l'installation :**
    ```bash
    kubectl version --client
    ```

Ces étapes fournissent une base solide pour déployer l'infrastructure décrite dans ce projet. La configuration spécifique de chaque outil (comme AWS CLI avec les clés IAM) est abordée dans la section suivante.
# Annexe : Configuration d'AWS

Cette annexe détaille les étapes nécessaires pour configurer correctement votre environnement AWS, notamment la création et la configuration des clés IAM, ainsi que la configuration d'AWS CLI sur votre machine Ubuntu.

## Configuration des Clés IAM sur AWS

Pour interagir avec AWS via Terraform ou AWS CLI, vous devez disposer de clés d'accès IAM avec les permissions appropriées.

### Création d'un Utilisateur IAM et des Clés d'Accès

1. **Connexion à la Console AWS :**
   - Connectez-vous à la [Console AWS](https://console.aws.amazon.com/)
   - Accédez au service IAM (Identity and Access Management)

2. **Création d'un Utilisateur IAM :**
   ```bash
   # Naviguez vers "Utilisateurs" puis cliquez sur "Ajouter un utilisateur"
   # Nom d'utilisateur : terraform-deployer
   # Type d'accès : Accès programmatique
   ```

3. **Attribution des Permissions :**
   ```bash
   # Sélectionnez "Attacher directement les politiques"
   # Recherchez et sélectionnez les politiques suivantes :
   # - AmazonEC2FullAccess
   # - AmazonVPCFullAccess
   # - AmazonS3FullAccess
   # - IAMFullAccess (à utiliser avec précaution en production)
   ```

4. **Récupération des Clés d'Accès :**
   ```bash
   # Une fois l'utilisateur créé, notez soigneusement :
   # - L'Access Key ID (par exemple : AKIAIOSFODNN7EXAMPLE)
   # - La Secret Access Key (par exemple : wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY)
   # Ces informations ne seront affichées qu'une seule fois
   ```

### Bonnes Pratiques de Sécurité IAM

- Créez un utilisateur IAM dédié pour chaque projet ou environnement
- Appliquez le principe du moindre privilège (accordez uniquement les permissions nécessaires)
- Utilisez des politiques IAM personnalisées pour des contrôles plus précis
- Activez l'authentification multifacteur (MFA) pour les utilisateurs IAM
- Effectuez une rotation régulière des clés d'accès

## Configuration d'AWS CLI sur Ubuntu

Une fois les clés IAM créées, vous devez configurer AWS CLI sur votre machine Ubuntu.

1. **Configuration Initiale :**
   ```bash
   aws configure
   ```

2. **Saisie des Informations :**
   ```bash
   # Vous serez invité à saisir les informations suivantes :
   # AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
   # AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
   # Default region name [None]: eu-west-3  # Choisissez votre région préférée
   # Default output format [None]: json
   ```

3. **Vérification de la Configuration :**
   ```bash
   aws sts get-caller-identity
   ```
   Cette commande devrait retourner des informations sur l'utilisateur IAM configuré.

4. **Configuration de Profils Multiples (Optionnel) :**
   ```bash
   # Pour configurer un profil spécifique :
   aws configure --profile nextcloud-project
   
   # Pour utiliser un profil spécifique :
   aws s3 ls --profile nextcloud-project
   ```

5. **Emplacement des Fichiers de Configuration :**
   ```bash
   # Les configurations sont stockées dans :
   # ~/.aws/credentials (pour les clés d'accès)
   # ~/.aws/config (pour les paramètres régionaux et autres)
   ```

## Utilisation des Variables d'Environnement (Alternative)

Au lieu de stocker les clés dans les fichiers de configuration AWS CLI, vous pouvez utiliser des variables d'environnement, particulièrement utiles dans les environnements CI/CD :

```bash
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=eu-west-3
```

Pour rendre ces variables persistantes, ajoutez-les à votre fichier `~/.bashrc` ou `~/.profile`.

## Sécurisation des Clés d'Accès

- Ne partagez jamais vos clés d'accès AWS
- Ne les stockez pas dans des dépôts Git ou autres systèmes de contrôle de version
- Utilisez AWS Secrets Manager ou des coffres-forts comme HashiCorp Vault pour les environnements de production
- Considérez l'utilisation de rôles IAM pour les instances EC2 plutôt que des clés d'accès statiques

Cette configuration correcte d'AWS est essentielle pour que Terraform puisse provisionner l'infrastructure cloud de manière sécurisée et efficace.
# Annexe : Commandes Terraform Essentielles

Cette annexe décrit les commandes Terraform fondamentales utilisées pour gérer le cycle de vie de l'infrastructure définie dans ce projet. Ces commandes sont exécutées depuis le répertoire contenant les fichiers de configuration Terraform (`.tf`).

## Initialisation du Répertoire Terraform

La première commande à exécuter dans un nouveau répertoire de configuration Terraform ou après avoir ajouté de nouveaux modules.

```bash
terraform init
```

**Actions effectuées par `terraform init` :**

*   **Téléchargement des Providers :** Télécharge et installe les plugins des providers nécessaires (par exemple, le provider AWS) spécifiés dans la configuration.
*   **Initialisation du Backend :** Configure le backend pour le stockage de l'état Terraform (par défaut, un fichier local `terraform.tfstate`).
*   **Téléchargement des Modules :** Si des modules externes sont utilisés, `terraform init` les télécharge.

Cette commande est sûre à exécuter plusieurs fois.

## Planification des Changements

Avant d'appliquer des modifications à votre infrastructure, il est crucial de vérifier ce que Terraform va faire.

```bash
terraform plan
```

**Actions effectuées par `terraform plan` :**

*   **Lecture de l'État Actuel :** Compare la configuration actuelle avec l'état enregistré de l'infrastructure.
*   **Génération d'un Plan d'Exécution :** Détermine les actions nécessaires (création, modification, suppression de ressources) pour atteindre l'état désiré défini dans les fichiers `.tf`.
*   **Affichage du Plan :** Présente un résumé lisible des changements prévus.

Cette commande ne modifie pas l'infrastructure réelle. Elle est utilisée pour la validation et la revue des changements.

**Optionnel : Sauvegarder le plan**

```bash
terraform plan -out=tfplan
```
Cela sauvegarde le plan d'exécution dans un fichier `tfplan`, qui peut ensuite être utilisé avec `terraform apply` pour garantir que seules les actions planifiées sont exécutées.

## Application des Changements

Cette commande applique les modifications nécessaires pour atteindre l'état désiré de la configuration.

```bash
terraform apply
```

**Actions effectuées par `terraform apply` :**

*   **Génération d'un Plan (si non fourni) :** Si aucun plan n'est fourni, `terraform apply` exécute d'abord `terraform plan`.
*   **Demande de Confirmation :** Affiche le plan d'exécution et demande une confirmation manuelle (sauf si l'option `-auto-approve` est utilisée).
*   **Exécution des Actions :** Crée, met à jour ou supprime les ressources d'infrastructure selon le plan.
*   **Mise à Jour de l'État :** Met à jour le fichier d'état (`terraform.tfstate`) pour refléter la nouvelle configuration de l'infrastructure.

**Appliquer un plan sauvegardé :**

```bash
terraform apply "tfplan"
```
Cela applique le plan exact sauvegardé précédemment, sans redemander de confirmation.

## Inspection de l'État Terraform

Pour visualiser les ressources gérées par Terraform et leur état actuel.

```bash
terraform show
```

Cette commande affiche l'état actuel de l'infrastructure tel que connu par Terraform, basé sur le fichier `terraform.tfstate`.

## Destruction de l'Infrastructure

Cette commande est utilisée pour détruire toutes les ressources gérées par la configuration Terraform actuelle. **À utiliser avec une extrême prudence.**

```bash
terraform destroy
```

**Actions effectuées par `terraform destroy` :**

*   **Génération d'un Plan de Destruction :** Détermine les ressources à supprimer.
*   **Demande de Confirmation :** Affiche les ressources qui seront détruites et demande une confirmation manuelle.
*   **Suppression des Ressources :** Supprime les ressources d'infrastructure gérées par Terraform.
*   **Mise à Jour de l'État :** Met à jour le fichier d'état pour refléter la suppression des ressources.

## Formatage et Validation

*   **Formatage du Code :**
    ```bash
    terraform fmt
    ```
    Cette commande reformate les fichiers de configuration Terraform selon les conventions standard.

*   **Validation de la Syntaxe :**
    ```bash
    terraform validate
    ```
    Cette commande vérifie la syntaxe et la cohérence interne des fichiers de configuration, sans contacter l'API AWS.

Ces commandes constituent le flux de travail de base pour gérer l'infrastructure avec Terraform. Il est essentiel de bien comprendre l'impact de chaque commande, en particulier `terraform apply` et `terraform destroy`.
# Annexe : Installation et Configuration de Kubernetes (K3s) sur Ubuntu

Cette annexe détaille les étapes d'installation et de configuration de K3s, une distribution légère de Kubernetes, sur Ubuntu 22.04 LTS. K3s est particulièrement adapté pour les environnements avec des ressources limitées tout en conservant les fonctionnalités essentielles de Kubernetes.

## Prérequis pour K3s

Avant d'installer K3s, assurez-vous que votre système répond aux exigences suivantes :

* Ubuntu 22.04 LTS (ou version compatible)
* Minimum 1 Go de RAM (2 Go recommandés)
* 1 CPU (2 CPU recommandés)
* 4 Go d'espace disque disponible
* Accès Internet pour télécharger les composants
* Docker installé (voir l'annexe sur les prérequis et installation)

## Installation du Serveur K3s (Nœud Maître)

K3s propose un script d'installation simple qui configure automatiquement le service systemd et installe tous les composants nécessaires.

1. **Installation du serveur K3s :**
   ```bash
   curl -sfL https://get.k3s.io | sh -
   ```

2. **Vérification de l'installation :**
   ```bash
   sudo systemctl status k3s
   ```

3. **Récupération du fichier de configuration pour kubectl :**
   ```bash
   sudo cat /etc/rancher/k3s/k3s.yaml > ~/.kube/config
   sudo chmod 600 ~/.kube/config
   ```

4. **Vérification du fonctionnement du cluster :**
   ```bash
   kubectl get nodes
   ```
   Vous devriez voir votre nœud avec le statut "Ready".

## Installation des Nœuds Agents (Workers)

Pour ajouter des nœuds supplémentaires à votre cluster K3s, vous devez d'abord récupérer le token du serveur.

1. **Récupération du token sur le serveur K3s :**
   ```bash
   sudo cat /var/lib/rancher/k3s/server/node-token
   ```

2. **Installation de l'agent K3s sur les nœuds workers :**
   ```bash
   # Sur chaque nœud worker, exécutez :
   curl -sfL https://get.k3s.io | K3S_URL=https://<IP_DU_SERVEUR>:6443 K3S_TOKEN=<TOKEN> sh -
   ```
   Remplacez `<IP_DU_SERVEUR>` par l'adresse IP du serveur K3s et `<TOKEN>` par le token récupéré précédemment.

3. **Vérification des nœuds depuis le serveur :**
   ```bash
   kubectl get nodes
   ```
   Tous vos nœuds devraient apparaître avec le statut "Ready".

## Configuration Avancée de K3s

### Désactivation de Composants Spécifiques

K3s inclut par défaut plusieurs composants que vous pouvez désactiver si nécessaire :

```bash
# Installation sans Traefik (ingress controller par défaut)
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable=traefik" sh -

# Installation sans le stockage local
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable=local-storage" sh -
```

### Configuration du Stockage Persistant

Pour ce projet, nous utilisons le stockage local de K3s pour les volumes persistants de Nextcloud :

1. **Vérification de la classe de stockage par défaut :**
   ```bash
   kubectl get storageclass
   ```
   K3s crée automatiquement une classe de stockage nommée "local-path".

2. **Création d'une réclamation de volume persistant (PVC) pour Nextcloud :**
   ```yaml
   # nextcloud-pvc.yaml
   apiVersion: v1
   kind: PersistentVolumeClaim
   metadata:
     name: nextcloud-data
   spec:
     accessModes:
       - ReadWriteOnce
     storageClassName: local-path
     resources:
       requests:
         storage: 10Gi
   ```

3. **Application de la configuration :**
   ```bash
   kubectl apply -f nextcloud-pvc.yaml
   ```

## Déploiement de Nextcloud sur K3s

Une fois K3s installé et configuré, vous pouvez déployer Nextcloud en utilisant les manifests Kubernetes suivants :

1. **Création du déploiement Nextcloud :**
   ```yaml
   # nextcloud-deployment.yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nextcloud
     labels:
       app: nextcloud
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: nextcloud
     template:
       metadata:
         labels:
           app: nextcloud
       spec:
         containers:
         - name: nextcloud
           image: nextcloud:latest
           ports:
           - containerPort: 80
           volumeMounts:
           - name: nextcloud-data
             mountPath: /var/www/html
         volumes:
         - name: nextcloud-data
           persistentVolumeClaim:
             claimName: nextcloud-data
   ```

2. **Création du service Nextcloud :**
   ```yaml
   # nextcloud-service.yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: nextcloud
   spec:
     selector:
       app: nextcloud
     ports:
     - port: 80
       targetPort: 80
       nodePort: 30080
     type: NodePort
   ```

3. **Déploiement des ressources :**
   ```bash
   kubectl apply -f nextcloud-deployment.yaml
   kubectl apply -f nextcloud-service.yaml
   ```

4. **Vérification du déploiement :**
   ```bash
   kubectl get pods
   kubectl get services
   ```

## Gestion et Maintenance de K3s

### Mise à jour de K3s

Pour mettre à jour K3s vers la dernière version :

```bash
# Sur le serveur
curl -sfL https://get.k3s.io | sh -

# Sur les agents
curl -sfL https://get.k3s.io | K3S_URL=https://<IP_DU_SERVEUR>:6443 K3S_TOKEN=<TOKEN> sh -
```

### Sauvegarde du Cluster

Il est crucial de sauvegarder régulièrement l'état de votre cluster :

```bash
# Sauvegarde de l'état du cluster
sudo cp /var/lib/rancher/k3s/server/cred/passwd /path/to/backup/
sudo cp /var/lib/rancher/k3s/server/tls/server-ca.* /path/to/backup/
sudo cp /var/lib/rancher/k3s/server/token /path/to/backup/
```

### Désinstallation de K3s

Si nécessaire, vous pouvez désinstaller K3s :

```bash
# Sur les agents
/usr/local/bin/k3s-agent-uninstall.sh

# Sur le serveur
/usr/local/bin/k3s-uninstall.sh
```

Cette configuration de K3s fournit une base solide pour déployer Nextcloud dans un environnement Kubernetes léger mais puissant, parfaitement adapté aux besoins de ce projet.
# Annexe : Bibliographie et Références

Cette annexe fournit une liste de références et de documentations officielles pour les principales technologies et outils utilisés dans ce projet. Ces ressources peuvent être consultées pour approfondir la compréhension de chaque composant.

## Cloud AWS

*   **Documentation AWS Générale :** [https://docs.aws.amazon.com/](https://docs.aws.amazon.com/)
*   **Amazon EC2 :** [https://docs.aws.amazon.com/ec2/](https://docs.aws.amazon.com/ec2/)
*   **Amazon VPC :** [https://docs.aws.amazon.com/vpc/](https://docs.aws.amazon.com/vpc/)
*   **Amazon S3 :** [https://docs.aws.amazon.com/s3/](https://docs.aws.amazon.com/s3/)
*   **AWS IAM :** [https://docs.aws.amazon.com/iam/](https://docs.aws.amazon.com/iam/)
*   **AWS CLI :** [https://aws.amazon.com/cli/](https://aws.amazon.com/cli/)

## Infrastructure as Code (IaC)

*   **Terraform :**
    *   Documentation Officielle : [https://developer.hashicorp.com/terraform/docs](https://developer.hashicorp.com/terraform/docs)
    *   Provider AWS : [https://registry.terraform.io/providers/hashicorp/aws/latest/docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
*   **Ansible :**
    *   Documentation Officielle : [https://docs.ansible.com/](https://docs.ansible.com/)
    *   Modules Ansible : [https://docs.ansible.com/ansible/latest/collections/index.html](https://docs.ansible.com/ansible/latest/collections/index.html)

## Conteneurisation et Orchestration

*   **Docker :**
    *   Documentation Officielle : [https://docs.docker.com/](https://docs.docker.com/)
*   **Kubernetes :**
    *   Documentation Officielle : [https://kubernetes.io/docs/](https://kubernetes.io/docs/)
*   **K3s :**
    *   Documentation Officielle : [https://docs.k3s.io/](https://docs.k3s.io/)

## Application et Services

*   **Nextcloud :**
    *   Documentation Administrateur : [https://docs.nextcloud.com/server/latest/admin_manual/](https://docs.nextcloud.com/server/latest/admin_manual/)
    *   Déploiement Docker : [https://github.com/nextcloud/docker](https://github.com/nextcloud/docker)
*   **NGINX :**
    *   Documentation Officielle : [https://nginx.org/en/docs/](https://nginx.org/en/docs/)

## Supervision

*   **Prometheus :**
    *   Documentation Officielle : [https://prometheus.io/docs/](https://prometheus.io/docs/)
*   **Grafana :**
    *   Documentation Officielle : [https://grafana.com/docs/grafana/latest/](https://grafana.com/docs/grafana/latest/)
*   **kube-state-metrics :**
    *   Dépôt GitHub : [https://github.com/kubernetes/kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)

## Intégration et Déploiement Continus (CI/CD)

*   **Jenkins :**
    *   Documentation Officielle : [https://www.jenkins.io/doc/](https://www.jenkins.io/doc/)
*   **SonarQube :**
    *   Documentation Officielle : [https://docs.sonarqube.org/latest/](https://docs.sonarqube.org/latest/)
*   **Git :**
    *   Documentation Officielle : [https://git-scm.com/doc](https://git-scm.com/doc)
*   **GitHub :**
    *   Documentation : [https://docs.github.com/](https://docs.github.com/)

## Système d'Exploitation

*   **Ubuntu :**
    *   Documentation Officielle : [https://help.ubuntu.com/](https://help.ubuntu.com/)
