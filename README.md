# DorkNet — site vitrine

## Mise en ligne (GitHub → Render)
1. Poussez ce dossier sur GitHub (le fichier `.env` est ignoré).
2. Supabase : exécutez `supabase.sql`. Authentication → Providers → Email : mot de passe minimum 12 caractères, confirmation d'e-mail activée. Authentication → Multi-Factor : activez TOTP.
3. Telegram : créez un bot avec @BotFather, copiez son token. Écrivez-lui une fois depuis votre compte pour qu'il puisse vous répondre.
4. Render → New → Blueprint → choisissez le dépôt. Renseignez les variables : `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_KEY`, `GEMINI_API_KEY`, `TELEGRAM_BOT_TOKEN`.
5. Test local : `npm install && node --env-file=.env server.js`.

## Sécurité réellement appliquée
- La clé Gemini et la clé service Supabase restent côté serveur, jamais dans le navigateur.
- HTTPS forcé, HSTS, CSP stricte (scripts inline autorisés par empreinte SHA-256), anti-clickjacking, Permissions-Policy.
- Limitation de débit (chat 12/min, contact 5/10 min), validation et nettoyage des entrées, champ piège anti-robots, filtre anti-prompt-injection.
- Comptes : Supabase Auth + double authentification TOTP obligatoire côté interface.

## Ce qui dépend de l'infrastructure ou n'est pas fourni par ce code
- TLS 1.3 : assuré par Render (vérifiez avec SSL Labs).
- DNSSEC : à activer chez votre registrar de domaine.
- FIDO2/YubiKey : non pris en charge par Supabase Auth aujourd'hui ; protégez votre propre compte Render, GitHub et Supabase avec une clé.
- HSM, KSI Blockchain, chiffrement post-quantique, Secure Enclave, E2EE : ne s'appliquent pas à un site vitrine. Ne les affichez pas comme des protections actives du site.
