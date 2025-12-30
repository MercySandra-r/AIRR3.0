# Airr 3.0: Transcript Intelligence Engine (Area A)

## Overview
A "Document Intelligence" POC that ingests raw PDF/Image transcripts, detects format drift using Vision AI (Gemini 1.5), and extracts structured data (GPA, Courses, Student Info) into Supabase.

## Tech Stack
* **Frontend:** HTML5 / Tailwind CSS (Deployed via Docker)
* **Orchestration:** n8n (Workflow automation)
* **AI Logic:** Google Gemini 1.5 Flash (Vision & Extraction)
* **Database:** Supabase (PostgreSQL + RLS)

## 🚀 Deployment Instructions (Coolify)

This POC is containerized and ready for deployment on OneOrigin NAS via Coolify.

### 1. Frontend Deployment
* **Source:** GitHub Repo
* **Build Type:** Dockerfile
* **Port Mapping:** Map internal port `80` to public port (e.g., `3000` or `https://qa.oneorigin.us`).
* **Environment Variables:**
    * *None required for Frontend (API keys are injected via client-side config or n8n webhook).*

### 2. Backend (n8n) Configuration
* **Service:** Self-hosted n8n (Coolify One-Click or Docker Image `n8nio/n8n`).
* **Environment Variables Needed:**
    * `GENERIC_TIMEZONE`: "Asia/Kolkata"
    * `N8N_HOST`: [Your Domain]
    * `N8N_PORT`: 5678
    * `WEBHOOK_URL`: https://[Your-n8n-Domain]/
* **Connections:**
    * **Supabase:** Connected via API URL/Key.
    * **Google Gemini:** Credential `Google PaLM API` configured in n8n.

### 3. Database (Supabase)
* **Tables:** `transcript_header`, `transcript_grades`
* **Migrations:** See `schema.sql` in this repo.

## How to Run Locally
1.  Clone repo.
2.  Open `transcript.html`.
3.  Upload `Chaminade_Transcript.pdf`.