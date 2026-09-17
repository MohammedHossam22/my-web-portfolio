
const stages = [
  "GitHub",
  "GitHub Actions",
  "Docker",
  "Amazon ECR",
  "Argo CD",
  "Kubernetes",
];

export function DevOpsArchitecture() {
  return (
    <section id="devops" className="border-t border-white/10 py-28">
      <div className="container-wide">
        <p className="text-sm uppercase tracking-[0.25em] text-zinc-500">DevOps</p>

        <div className="mt-4 grid gap-12 md:grid-cols-[0.8fr_1.2fr]">
          <div>
            <h2 className="text-3xl font-semibold tracking-tight md:text-5xl">
              The website is a DevOps project too.
            </h2>
            <p className="mt-6 leading-8 text-zinc-400">
              The target deployment architecture is containerized services
              running on Kubernetes, with automated image delivery and GitOps.
              This section will evolve as the infrastructure is implemented.
            </p>
          </div>

          <div className="glass rounded-3xl p-6 md:p-8">
            <p className="mb-6 text-xs uppercase tracking-[0.2em] text-zinc-500">
              Delivery pipeline
            </p>

            <div className="space-y-3">
              {stages.map((stage, index) => (
                <div key={stage}>
                  <div className="flex items-center justify-between rounded-2xl border border-white/10 bg-white/[0.025] p-4">
                    <span className="font-medium">{stage}</span>
                    <span className="font-mono text-xs text-zinc-600">
                      {String(index + 1).padStart(2, "0")}
                    </span>
                  </div>

                  {index < stages.length - 1 && (
                    <div className="ml-6 h-3 w-px bg-white/10" />
                  )}
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
