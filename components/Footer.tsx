// STEP: Footer.
// Keep this simple; the main content should remain the focus.

import { site } from "@/data/site";

export function Footer() {
  return (
    <footer className="border-t border-white/10 py-8">
      <div className="container-wide flex flex-col justify-between gap-3 text-sm text-zinc-600 sm:flex-row">
        <p>© {new Date().getFullYear()} {site.name}</p>
        <p>{site.role}</p>
      </div>
    </footer>
  );
}
