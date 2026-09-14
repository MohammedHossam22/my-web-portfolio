// STEP: Hero section.
// This is the first impression. Keep the message short and focused on your
// primary professional identity rather than listing every technology you know.

import Link from "next/link";
import { ArrowDown, ArrowUpRight } from "lucide-react";
import { site } from "@/data/site";


export function Hero() {
  return (
    <section className="relative flex min-h-screen items-center overflow-hidden">
      <div className="absolute inset-0 tech-grid opacity-70" />
      <div className="absolute left-1/2 top-1/3 h-72 w-72 -translate-x-1/2 rounded-full bg-white/[0.04] blur-3xl" />
      

      <div className="container-wide relative pt-20">

        {/* STEP: Hero text/content.
            We give this a maximum width so the image on the right
            never overlaps the important text. */}
        <div className="max-w-2xl">

          <p className="mb-6 text-sm font-medium tracking-[0.3em] text-zinc-500">
            {site.hero.eyebrow}
          </p>

          <h1 className="text-5xl font-semibold leading-[1.02] tracking-[-0.04em] sm:text-6xl md:text-8xl">
            {site.name}
          </h1>

          <p className="mt-5 text-xl font-medium text-zinc-300 md:text-2xl">
            {site.role}
          </p>

          <p className="mt-7 max-w-2xl text-base leading-8 text-zinc-400 md:text-lg">
            {site.hero.description}
          </p>

          <div className="mt-10 flex flex-wrap gap-4">
            <a
              href="#projects"
              className="inline-flex items-center gap-2 rounded-full bg-white px-6 py-3 text-sm font-semibold text-black transition hover:bg-zinc-200"
            >
              Explore my work
            </a>

            <Link
              href="/cv"
              className="rounded-full border border-white/15 px-6 py-3 text-sm font-semibold transition hover:bg-white/10"
            >
              Read my CV
            </Link>
          </div>

        </div>

        {/* STEP: Profile image.
            `absolute` removes the image from the normal layout flow.
            Therefore, adding/removing/resizing the image will NOT
            move the text or buttons. */}

        <div className="pointer-events-none absolute right-0 top-1/2 hidden -translate-y-1/2 md:block">
          <div className="relative h-[420px] w-[340px]">

            {/* Optional subtle background behind the image */}
            <div className="absolute inset-10 rounded-full bg-white/[0.04] blur-3xl" />

            <img src="/cv/worrior.jpeg" alt="Profile photo" className="relative h-full w-full object-contain"/>

          </div>
        </div>


        <div className="mt-24 flex items-center gap-3 text-sm text-zinc-500">
          <ArrowDown size={16} />
          Scroll to explore
        </div>
      </div>
    </section>
  );
}
