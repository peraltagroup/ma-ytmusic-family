# Music Assistant (YouTube Music Family) add-on

Home Assistant add-on that runs **Music Assistant Server 2.11.0b2** with the
**"YouTube Music (Family)"** provider baked in.

- One-time cookie login per family member (sign in to music.youtube.com once)
- Shared library for party use (one provider instance per household member)
- Offline playlist downloads
- Ad-free streaming (anonymous yt-dlp resolution, no PO tokens)
- Hard YouTube Music Premium gate (D7)

## Prerequisites

- A **YouTube Music Premium** account per family member (required, D7).
- The add-on image must be built and pushed to GHCR first (see `build.sh`):
  `ghcr.io/peraltagroup/ma-ytmusic-family:2.11.0b6`

## Install

1. In Home Assistant: **Settings -> Devices & Services -> Add Integration** is
   NOT how add-ons are installed. Instead:
   **Settings -> Add-ons -> menu (top-right) -> Add-on Store -> Add repository**
   and paste the URL of this repository, e.g.
   `https://github.com/peraltagroup/ma-ytmusic-family`
2. Open the **Music Assistant (YouTube Music Family)** add-on and **Install**.
3. **Start** the add-on. The Music Assistant panel appears under
   **Dashboard -> Music Assistant** (ingress).

## Onboard a family member

1. In the MA panel: **Providers -> Add provider -> YouTube Music (Family)**.
2. Enter a display name (optional).
3. Paste the member's `music.youtube.com` cookie (the setup screen explains
   how to copy it from DevTools). The cookie must contain `__Secure-3PAPISID`.
4. The provider verifies the account is YouTube Music Premium, stores the
   cookie encrypted in the MA config dir, and finishes.
5. Repeat for each family member (multi-instance).

Cookies typically stay valid for about a year; when one expires the provider
reports `token_invalidated` and re-onboarding takes one minute.

## Notes

- This is a fork of the official Music Assistant beta add-on
  (`music_assistant_beta`, v2.11.0b2) with only the `image`, `name`, `slug`,
  `description`, and `stage` fields changed.
- The provider is **experimental** stage.
- Config, media, and token storage live in the add-on's `config` and `media`
  volumes (same as the official MA add-on).
