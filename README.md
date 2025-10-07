# 🎓 Data Mart – Formation & Rendement des Formateurs

## 📘 Description
Ce projet met en place un **Data Mart** pour un centre de formation.  
Il permet d’analyser :
- Les **inscriptions des étudiants** par formation et type d’enseignement  
- Le **rendement des formateurs** (séances, absences, durée, etc.)

---

## 🧩 Structure du projet

### 🔹 Base opérationnelle (OLTP)
Tables principales :
- `Etudiant`, `Formateur`, `Formation`, `Sessionn`, `Inscription`, `Seance`, `Abscence`, `Salle`, `Specialite`

### 🔹 Data Mart (modèle en étoile)
Tables de faits :
- `FORM_FACT_DEMANDEFORMATION`
- `FORM_FACT_RENDEMENTFORMATEURR`

Tables de dimensions :
- `FORM_DIM_DATE`, `FORM_DIM_ETUDIANT`, `FORM_DIM_FORMATION`,  
  `FORM_DIM_SPECIALITE`, `FORM_DIM_FORMATEUR`, `FORM_DIM_TYPEENSEIGNEMENT`

---

## ⚙️ Procédures principales
- `Pform_Dim_*` → Alimentation des dimensions  
- `Pform_fact_DemandeFormation` → Faits des inscriptions  
- `Pform_fact_RendementFormateur` → Faits du rendement des formateurs  

---

## 🚀 Exécution
1. Créez une base Oracle.
2. Exécutez le script `Modelisation.sql` dans SQL Developer.
3. Lancez les procédures :
```sql
BEGIN
  Pform_Dim_TypeEnseignement;
  Pform_Dim_Formation;
  Pform_Dim_Etudiant;
  Pform_Dim_Specialite;
  Pform_Dim_Formateur;
  Pform_Dim_Date;
  Pform_fact_DemandeFormation;
  Pform_fact_RendementFormateur;
END;
/
