# Music Assistant (YouTube Music Family) add-on

Home Assistant add-on that runs **Music Assistant Server 2.11.0b4** with the
**"YouTube Music (Family)"** provider baked in.

- One-time device-code login per family member (`https://www.youtube.com/activate`)
- Shared library for party use (one provider instance per household member)
- Offline playlist downloads
- No cookies, no PO tokens, no sidecars
- Hard YouTube Music Premium gate (D7)

## Prerequisites

- A **YouTube Music Premium** account per family member (required, D7).
- The add-on image must be built and pushed to GHCR first (see `build.sh`):
  `ghcr.io/peraltagroup/ma-ytmusic-family:2.11.0b4`

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
2. Enter a display name. The add-on shows a **user code**.
3. On any device, open **<https://www.youtube.com/activate>**, sign in with the
   member's Premium account, and enter the code.
4. Wait for activation. The provider verifies Premium, stores encrypted tokens
   in the MA config dir, and finishes.
5. Repeat for each family member (multi-instance).

## Notes

- This is a fork of the official Music Assistant beta add-on
  (`music_assistant_beta`, v2.11.0b2) with only the `image`, `name`, `slug`,
  `description`, and `stage` fields changed.
- The provider is **experimental** stage.
- Config, media, and token storage live in the add-on's `config` and `media`
  volumes (same as the official MA add-on).
