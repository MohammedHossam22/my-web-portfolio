// STEP: Projects section.
// Projects are intentionally presented as case-study entry points.
// Later, each project can become its own route such as /projects/bookstore.

import { ArrowUpRight } from "lucide-react";
import { projects } from "@/data/projects";

export function Projects() {
  return (
    <section id="projects" className="border-t border-white/10 py-28">
      <div className="container-wide">
        <div className="flex flex-col justify-between gap-6 md:flex-row md:items-end">
          <div>
            <p className="text-sm uppercase tracking-[0.25em] text-zinc-500">Projects</p>
            <h2 className="mt-4 text-3xl font-semibold tracking-tight md:text-5xl">
              Things I&apos;ve built.
            </h2>
          </div>

          <p className="max-w-md text-sm leading-6 text-zinc-500">
            A growing collection of software, automation, and DevOps work.
          </p>
        </div>

        <div className="mt-12 space-y-4">
          {projects.map((project) => (
            <article
              key={project.number}
              className="group grid gap-6 rounded-3xl border border-white/10 p-6 transition hover:bg-white/[0.03] md:grid-cols-[90px_1fr_auto] md:items-center md:p-8"
            >
              <p className="font-mono text-sm text-zinc-600">{project.number}</p>

              <div>
                <h3 className="text-2xl font-semibold">{project.title}</h3>
                <p className="mt-2 max-w-2xl leading-7 text-zinc-400">
                  {project.description}
                </p>

                <div className="mt-5 flex flex-wrap gap-2">
                  {project.technologies.map((technology) => (
                    <span
                      key={technology}
                      className="rounded-full bg-white/5 px-3 py-1 text-xs text-zinc-400"
                    >
                      {technology}
                    </span>
                  ))}
                </div>
              </div>

              <a
                href={project.github}
                target="_blank"
                rel="noreferrer"
                className="inline-flex items-center gap-2 text-sm font-medium text-zinc-300 hover:text-white"
              >
                GitHub <ArrowUpRight size={16} />
              </a>
            </article>
          ))}
        </div>
      </div>
    </section>
  );
}
