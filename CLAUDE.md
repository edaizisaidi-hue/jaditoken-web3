# jaditoken-web3 — Project Guide

## WHY
Platform Web3 untuk tokenisasi aset (Jaditoken).

## WHAT (Tech Stack)
- OS: Android/Termux (Physical Armory)
- Backend: Node.js, Prisma ORM
- Database: PostgreSQL (via pg)
- Orchestrator: ALIF v5.x

## HOW (Commands)
- Build: `npm run build`
- Dev: `npm run dev`
- DB Push: `npx prisma db push`
- System Check: `~/alif.sh`

## CONVENTIONS
- Never commit .env files.
- Prefer functional components for logic.
- All threats/suspicious scripts move to ALIF_ARMORY.
