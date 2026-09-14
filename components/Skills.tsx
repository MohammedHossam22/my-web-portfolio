// STEP: Skills section.
// This reads from data/skills.ts, so you can add/remove skills without
// changing this component.

import { skillGroups } from "@/data/skills";

export function Skills() {
  return (
    <section id="skills" className="border-t border-white/10 py-28">
      <div className="container-wide">
        <p className="text-sm uppercase tracking-[0.25em] text-zinc-500">Skills</p>
        <h2 className="mt-4 max-w-2xl text-3xl font-semibold tracking-tight md:text-5xl">
          Tools I use to build and automate.
        </h2>

        <div className="mt-12 grid gap-5 md:grid-cols-2">
          {skillGroups.map((group, index) => (
            <article key={group.title} className="glass rounded-3xl p-7">
              <p className="text-sm text-zinc-600">0{index + 1}</p>
              <h3 className="mt-5 text-2xl font-semibold">{group.title}</h3>
              <p className="mt-3 leading-7 text-zinc-400">{group.description}</p>

              <div className="mt-6 flex flex-wrap gap-2">
                {group.skills.map((skill) => (
                  <span
                    key={skill}
                    className="rounded-full border border-white/10 px-3 py-1.5 text-sm text-zinc-300"
                  >
                    {skill}
                  </span>
                ))}
              </div>
            </article>
          ))}
        </div>
      </div>
    </section>
  );
}
