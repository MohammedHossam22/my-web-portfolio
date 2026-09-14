// STEP: Root layout.
// This wraps every page in the application.
// Global metadata belongs here because it affects the whole website.

import type { Metadata } from "next";
import "./globals.css";
import { site } from "@/data/site";

export const metadata: Metadata = {
  title: `${site.name} | ${site.role}`,
  description:
    "Personal portfolio of Mohammed Hossam — Cloud DevOps Engineer and Software Developer.",
};

export default function RootLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
