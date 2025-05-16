
# Ondaum application - App
> Hello👋 This is team Ondaum. ***Ondaum*** is a pure Korean word, meaning ***'a warm and genuine self'***.

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Google Gemini](https://img.shields.io/badge/google%20gemini-8E75B2?style=for-the-badge&logo=google%20gemini&logoColor=white)

## 🌍 OVERVIEW
We want to help people around the world live healthier lives by being with Um, an AI professional psychological counseling companion, anytime and anywhere.

In the past year, 73.6% of Korean young adults experienced mental health challenges. In addition, global statistics reveal that 66% of individuals aged 18-24 report experiencing moderate to severe.

Ondaum provides accessible, mental health support anytime, anywhere, reducing financial and stigma barriers. The chatbot analyzes conversations in real time to detect risk signals and offer timely support, while its friendly interface keeps users engaged and lowers resistance.

Let's start https://ondaum.revimal.me/

#### .APK
https://drive.google.com/file/d/1hfUUa8xL_KVhYdOc8I2o2o2bJ3Hq6W9J/view?usp=drive_link

#### .IPA (we don't have apple developer account)
https://drive.google.com/file/d/1k_bUF3nCy_BB4YvmuT8Vk7bpGrps31hQ/view?usp=drive_link


#### 📱 FEATURES
- AI Counseling With Um
  - Personalized Psychological Assessments & Real-Time Crisis Response
- Psychological Assessments
  - International standard tests(PHQ-9 / GAD-7 / PSS)
  - Deliver tailored insights and links to support upon risk detection
- AI Analysis of Conversation Content
  - Summary and organization of the conversation
  - extracting key emotions and keywords
  - visualize the recommends using charts

#### ✨ VALUES
- Available for consultation anytime, anywhere
- Personalized consultation possible
- Reduced barriers to seeking counseling
- Access to a pre-trained professional psychological counseling AI

## 🛠 SKILLS
- **Web**: React, Typescript, Zustand, WebSocket, TailwindCSS
- **Mobile**: Flutter, Dart
- **AI**: Gemini-2.5-Pro
- **Auth**: Google Oauth, jwt
- **Bundler**: Vite, 
- **Package Manager**: NPM
- **Logging System**: Google Analytics

## 🏛️ CLIENT ARCHITECTURE
```mermaid
graph TD
    Web[Web]
    iOS[iOS]
    Android[Android]
    Ondaum[ondaum-client]
    Flutter[ondaum-application]

    Flutter --> iOS
    Flutter --> Android
    Ondaum --> Web
    Ondaum --> Flutter
```
  
## 📁 DIRECTORY
```
app/
├── android/           
│   ├── app
├── ios/       
│   ├── Flutter
│   └── Runner    
├── lib/
│   └──  main.dart # Webview Setting  
```

## 🚀 INSTALLATION

1. Intsall Flutter
```bash
git clone https://github.com/flutter/flutter.git -b stable
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.zshrc
source ~/.zshrc
flutter --version
```

2-1. Run Android
```bash
flutter run
```

2-2. Run iOS
```bash
flutter pub get
cd ios
pod install
cd ..
flutter run
```

## 🖥️ SCREENS

| |
|:--:|
| <img width="543" alt="image" src="https://github.com/user-attachments/assets/fb658963-0ce9-46b9-b7b0-ca5014c4156d" /> | 
 | <img width="540" alt="image" src="https://github.com/user-attachments/assets/5b469fb4-a23b-4e9c-b432-75d81669a94e" /> | 
 | <img width="881" alt="image" src="https://github.com/user-attachments/assets/d931f45b-afc1-49bb-8481-96ccbce65b3a" /> | 
 | <img width="313" alt="image" src="https://github.com/user-attachments/assets/95f52feb-708f-4112-a668-5b4eada0990d" /> | 


📅 This README was written on **May 15, 2025**.
