
import Link from "next/link";
import { site } from "@/data/site";

export function Navbar() {
  return (
    <header className="fixed inset-x-0 top-0 z-50 border-b border-white/10 bg-[#07090d]/80 backdrop-blur-xl">
      <div className="container-wide flex h-16 items-center justify-between">
        <Link href="/" className="font-semibold tracking-tight">
          <span className="text-white">MH</span>
          <span className="ml-2 text-zinc-500">/ portfolio</span>
        </Link>

        <nav className="hidden items-center gap-7 text-sm text-zinc-400 md:flex">
          <a className="transition hover:text-white" href="#about">About</a>
          <a className="transition hover:text-white" href="#skills">Skills</a>
          <a className="transition hover:text-white" href="#projects">Projects</a>
          <a className="transition hover:text-white" href="#devops">DevOps</a>
          <a className="transition hover:text-white" href="#contact">Contact</a>
        </nav>

        <a
          href="/cv/Mohammed-Hossam-devops.pdf"
          target="_blank"
          rel="noreferrer"
          className="rounded-full border border-white/15 px-4 py-2 text-sm font-medium transition hover:bg-white hover:text-black"
        >
          View CV
        </a>
      </div>
    </header>
  );
}
