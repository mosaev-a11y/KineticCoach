# KineticCoach: Wearable-Free 3D Rehab Biofeedback & Multi-Cloud Biomechanics Portal

**KineticCoach** turns any standard webcam into a real-time 3D physical therapy biofeedback coach, direct headless MATLAB biomechanics analyzer, and autonomous telehealth billing portal.

## Key Features & Sponsor Track Integrations
- **Computer Vision & Real-Time Biofeedback:** Python 3.12, OpenCV, and Google MediaPipe Pose tracking 3D joint angles at 30+ FPS with visual skeleton overlays and winsound auditory biofeedback chimes.
- **Direct MATLAB Engine (analyze_kinematics.m):** Automated headless execution (matlab -batch) computing 3-point smoothed Range of Motion, Angular Velocity, Angular Acceleration, and Root-Mean-Square (RMS) Kinematic Jerk, exporting matlab_results.json and matlab_biomechanics.png.
- **Google Gemini API (gemini-2.5-flash):** Synthesizes session kinematics into insurance-ready CPT 98977 Remote Therapeutic Monitoring clinical progress notes.
- **Grok Bot (SpaceXSI Challenge):** Evaluates 3rd-derivative kinematic jerk for astronaut microgravity muscle-atrophy countermeasures and sensorimotor stability.
- **TinyFish Autonomous Web Agent:** Packages verified session metrics into tinyfish_ehr_payload.json for automated outpatient clinic EHR claim filing.
- **MongoDB Atlas:** Formats longitudinal patient biomechanics and MATLAB derivatives into a time-series NoSQL document (mongodb_atlas_doc.json).
- **Solana Proof-of-Rehab Attestation:** Hashes session telemetry (SHA-256) and signs a Solana Devnet Memo transaction (solana_attestation.json) to prevent CPT 98977 insurance billing fraud.
- **Edge Hardware Ready:** Streams 115200-baud UART packets for ESP32 haptic vibration cuffs and Raspberry Pi edge deployment.

## Quick Start
1. Install dependencies: pip install opencv-python mediapipe==0.10.14 protobuf==4.25.9 google-genai numpy
2. Run the prototype: python coach.py
3. Controls: [1] Phase 1 Blind Baseline | [2] Phase 2 Guided Biofeedback | [SPACE] Score Rep | [a] Arm Mode | [k] Knee Mode | [q] Quit & Run MATLAB + Open Telehealth Portal
