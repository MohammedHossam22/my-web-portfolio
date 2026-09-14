// STEP: Dedicated CV page.
// The actual PDF is stored in `public/cv/`.
// Put your latest CV at the exact filename used below.

import Link from "next/link";
import { ArrowLeft, Download } from "lucide-react";

export default function CVPage() {
  return (
    <main className="min-h-screen bg-[#07090d] px-5 py-8">
      <div className="mx-auto max-w-6xl">
        <div className="mb-6 flex flex-wrap items-center justify-between gap-4">
          <Link href="/" className="inline-flex items-center gap-2 text-sm text-zinc-400 hover:text-white">
            <ArrowLeft size={16} /> Back to portfolio
          </Link>

          <a
            href="/cv/Mohammed-Hossam-devops.pdf"
            download
            className="inline-flex items-center gap-2 rounded-full bg-white px-5 py-2.5 text-sm font-semibold text-black"
          >
            <Download size={16} /> Download CV
          </a>
        </div>

        {/* STEP: Browser-native PDF viewer.
            This lets visitors read the CV without leaving your website. */}
        <div className="overflow-hidden rounded-2xl border border-white/10 bg-white">
          <iframe
            src="/cv/Mohammed-Hossam-devops.pdf"
            title="Mohammed Hossam CV"
            className="h-[calc(100vh-130px)] min-h-[700px] w-full"
          />
        </div>
      </div>
    </main>
  );
}
