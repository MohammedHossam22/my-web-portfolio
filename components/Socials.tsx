

import { Github, Linkedin, Mail, ArrowUpRight } from "lucide-react";
import { site } from "@/data/site";

export function Socials() {
  const accounts = [
    {
      name: "GitHub",
      description: "Code, projects, experiments, and DevOps work.",
      href: site.links.github,
      icon: Github,
    },
    {
      name: "LinkedIn",
      description: "Professional profile and career updates.",
      href: site.links.linkedin,
      icon: Linkedin,
    },
    {
      name: "Email",
      description: site.email,
      href: `mailto:${site.email}`,
      icon: Mail,
    },
  ];

  return (
    <section className="border-t border-white/10 py-28">
      <div className="container-wide">
        <p className="text-sm uppercase tracking-[0.25em] text-zinc-500">Connect</p>
        <h2 className="mt-4 text-3xl font-semibold tracking-tight md:text-5xl">
          Find me online.
        </h2>

        <div className="mt-12 grid gap-4 md:grid-cols-3">
          {accounts.map(({ name, description, href, icon: Icon }) => (
            <a
              key={name}
              href={href}
              target={name === "Email" ? undefined : "_blank"}
              rel={name === "Email" ? undefined : "noreferrer"}
              className="group glass rounded-3xl p-6 transition hover:-translate-y-1"
            >
              <div className="flex items-start justify-between">
                <Icon size={24} strokeWidth={1.6} />
                <ArrowUpRight
                  size={18}
                  className="text-zinc-600 transition group-hover:text-white"
                />
              </div>
              <h3 className="mt-10 text-xl font-semibold">{name}</h3>
              <p className="mt-2 text-sm leading-6 text-zinc-500">{description}</p>
            </a>
          ))}
        </div>
      </div>
    </section>
  );
}
