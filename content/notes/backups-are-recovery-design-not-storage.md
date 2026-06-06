---
title: "Backups are recovery design, not storage"
date: 2026-02-06
tags: ["backups", "self-hosting", "media"]
description: "A backup strategy is only real when restore paths, scope, and failure modes are known."
---

Backups are not defined by where files are copied.

They are defined by what can be restored, how quickly, after which failure, and with how much acceptable data loss. Photos, databases, containers, configs, and devices may need different recovery paths.

Storage is the easy part. Recovery design is the backup.

Related:

- [[SelfHosting] Image & Backup Tools]({{< relref "/blog/selfhost-2602-img-bkp.md" >}})
