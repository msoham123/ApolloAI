import 'package:flutter/material.dart';

class Disease {
  String title, medication, treatment, type, symptoms, description;
  Image diseaseImage;

  Disease(String title, String description, String medication, String treatment, String type, String symptoms, Image diseaseImage ){
    this.title = title;
    this.description = description;
    this.medication = medication;
    this.treatment = treatment;
    this.type = type;
    this.symptoms = symptoms;
    this.diseaseImage = diseaseImage;
  }
}

class DiseaseBase{
  static var diseaseList = [
    Disease(
      "Pneumonia",
      "Pneumonia is an infection that inflames the air sacs in one or both lungs. The air sacs may fill with fluid or pus (purulent material), causing cough with phlegm or pus, fever, chills, and difficulty breathing. A variety of organisms, including bacteria, viruses and fungi, can cause pneumonia.",
      "https://www.mayoclinic.org/diseases-conditions/pneumonia/symptoms-causes/syc-20354204?page=0&citems=10",
      "Get vaccinated. Vaccines are available to prevent some types of pneumonia and the flu. Talk with your doctor about getting these shots. The vaccination guidelines have changed over time so make sure to review your vaccination status with your doctor even if you recall previously receiving a pneumonia vaccine.",
      "Multiple",
      "Chest pain when you breathe or cough. Confusion or changes in mental awareness (in adults age 65 and older)",
      Image.asset("assets/person1_virus_6.png",fit: BoxFit.fill),
    ),
    Disease(
        "Malaria",
        "Malaria is a serious disease caused by a parasite. You get it when an infected mosquito bites you. There are four different types of malaria caused by four related parasites.",
        "https://www.cdc.gov/malaria/travelers/drugs.html",
        "Malaria can be prevented - When traveling to areas where malaria is found, see your doctor for medicines that protect you, wear insect repellent with DEET, cover up, and sleep under mosquito netting.",
        "Parasite",
        "Symptoms include chills, flu-like symptoms, fever, vomiting, diarrhea, and jaundice. A blood test can diagnose it. It can be life-threatening.",
        Image.asset("assets/diseases/malaria.jpg",fit: BoxFit.fill),
        ),
    Disease(
      "HIV/AIDS",
      "HIV most often spreads through unprotected sex with a person who has HIV. It may also spread by sharing drug needles or through contact with the blood of a person who has HIV. Women can give it to their babies during pregnancy or childbirth.",
      "https://medlineplus.gov/hivprepandpep.html",
      "Strategies to reduce the risk of HIV infection include not having sex, limiting your number of sexual partners, never sharing needles, and using condoms the right way every time you have sex. People who are at high risk may take HIV prevention medicines.",
      "Virus",
      "The first signs of HIV infection may be swollen glands and flu-like symptoms. These may come and go within two to four weeks. Severe symptoms may not appear until months or years later.",
      Image.asset("assets/diseases/HIV.jpg",fit: BoxFit.fill),
    ),
    Disease(
      "Tuberculosis",
      "Tuberculosis (TB) is a disease caused by bacteria called Mycobacterium tuberculosis. The bacteria usually attack the lungs, but they can also damage other parts of the body. TB spreads through the air when a person with TB of the lungs or throat coughs, sneezes, or talks.",
      "https://medlineplus.gov/druginfo/meds/a682402.html",
      "Malaria can be prevented : When traveling to areas where malaria is found - See your doctor for medicines that protect youWear insect repellent with DEET - Cover up - Sleep under mosquito netting",
      "Bacteria",
      "Symptoms of TB in the lungs may include : A bad cough that lasts 3 weeks or longer, weight loss, loss of appetite, coughing up blood or mucus, weakness or fatigue, fever, and night sweats.",
      Image.asset("assets/diseases/tuberculosis.jpg",fit: BoxFit.fill),
    ),
    Disease(
      "Diarrhea",
      "Diarrhea is loose, watery stools (bowel movements). You have diarrhea if you have loose stools three or more times in one day.",
      "https://medlineplus.gov/druginfo/meds/a604027.html",
      "Diarrhea is treated by replacing lost fluids and electrolytes to prevent dehydration. Depending on the cause of the problem, you may need medicines to stop the diarrhea or treat an infection.",
      "Multiple",
      "Symptoms of diarrhea include : Cramps or pain in the abdomen, an urgent need to use the bathroom, loss of bowel control, dehydration. If a virus or bacteria is the cause of your diarrhea, you may also have a fever, chills, and bloody stools.",
      Image.asset("assets/diseases/DIARRHEA.png",fit: BoxFit.fill),
    ),
  ];


  //https://80000hours.org/problem-profiles/health-in-poor-countries/
// https://medlineplus.gov/
}

