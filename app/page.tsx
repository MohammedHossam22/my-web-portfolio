// STEP: Home page.
// This file composes reusable sections.
// If you create another section, import it here and place it in the desired order.

import { Navbar } from "@/components/Navbar";
import { Hero } from "@/components/Hero";
import { About } from "@/components/About";
import { Skills } from "@/components/Skills";
import { Projects } from "@/components/Projects";
import { DevOpsArchitecture } from "@/components/DevOpsArchitecture";
import { Socials } from "@/components/Socials";
import { Footer } from "@/components/Footer";
import { site } from "@/data/site";

export default function Home() {
  return (
    <>
      <Navbar />

      <main>
        <Hero />
        <About />
        <Skills />
        <Projects />
        <DevOpsArchitecture />
        <Socials />

        {/* STEP: Simple contact call-to-action.
            A real contact microservice can be connected in a later phase. */}
        <section id="contact" className="border-t border-white/10 py-28">
          <div className="container-wide">
            <p className="text-sm uppercase tracking-[0.25em] text-zinc-500">06 / Contact</p>
            <h2 className="mt-4 max-w-3xl text-4xl font-semibold tracking-tight md:text-6xl">
              Have a project, opportunity, or technical conversation in mind?
            </h2>
            <a
              href={`mailto:${site.email}`}
              className="mt-8 inline-block rounded-full bg-white px-6 py-3 text-sm font-semibold text-black transition hover:bg-zinc-200"
            >
              Get in touch
            </a>
          </div>
        </section>
      </main>

      <Footer />
    </>
  );
}
