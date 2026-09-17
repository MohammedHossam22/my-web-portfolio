

import { site } from "@/data/site";

export function About() {
  return (
    <section id="about" className="border-t border-white/10 py-28">
      <div className="container-wide grid gap-12 md:grid-cols-[0.8fr_1.2fr]">
        <div>
          <p className="text-sm uppercase tracking-[0.25em] text-zinc-500">About</p>
          <h2 className="mt-4 text-3xl font-semibold tracking-tight md:text-5xl">
            Building with a systems mindset.
          </h2>
        </div>

        <div>
          <p className="text-xl leading-9 text-zinc-300">{site.about}</p>

          <div className="mt-10 grid gap-4 sm:grid-cols-3">
            {[
              ["Focus", "Cloud & DevOps"],
              ["Foundation", "Computer Engineering"],
              ["Direction", "DevSecOps"],
            ].map(([label, value]) => (
              <div key={label} className="glass rounded-2xl p-5">
                <p className="text-xs uppercase tracking-widest text-zinc-500">{label}</p>
                <p className="mt-3 font-medium text-zinc-200">{value}</p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
