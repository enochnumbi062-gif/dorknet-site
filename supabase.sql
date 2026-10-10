-- À exécuter dans Supabase > SQL Editor
create table if not exists public.demandes (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  nom text,
  kind text check (kind in ('devis','support')),
  projet text,
  message text
);
-- RLS activée sans aucune policy publique : seule la clé service_role (serveur) peut lire et écrire.
alter table public.demandes enable row level security;
